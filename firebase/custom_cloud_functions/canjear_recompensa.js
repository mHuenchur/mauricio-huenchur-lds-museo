const functions = require("firebase-functions");
const admin = require("firebase-admin");
const crypto = require("crypto");

// FlutterFlow inicializa Firebase Admin.
// No agregar admin.initializeApp() aquí.

exports.canjearRecompensa = functions
  .runWith({ timeoutSeconds: 30 })
  .https.onCall(async (data, context) => {
    const error = (codigo, mensaje) => {
      throw new functions.https.HttpsError(codigo, mensaje);
    };

    // 1. Identificar al usuario desde su sesión.
    if (!context.auth || !context.auth.uid) {
      error("unauthenticated", "Debés iniciar sesión para canjear.");
    }

    const uid = context.auth.uid;
    const recompensaId = data && data.recompensaId;
    const solicitudId = data && data.solicitudId;

    // 2. Validar los parámetros.
    if (
      typeof recompensaId !== "string" ||
      recompensaId.length === 0 ||
      recompensaId.length > 128 ||
      recompensaId.includes("/") ||
      recompensaId === "." ||
      recompensaId === ".."
    ) {
      error("invalid-argument", "La recompensa no es válida.");
    }

    if (
      typeof solicitudId !== "string" ||
      !/^[A-Za-z0-9_-]{16,128}$/.test(solicitudId)
    ) {
      error("invalid-argument", "El identificador de solicitud no es válido.");
    }

    const db = admin.firestore();

    const usuarioRef = db.collection("Users").doc(uid);
    const recompensaRef = db.collection("recompensas").doc(recompensaId);

    // La misma solicitud del mismo usuario identifica el mismo cupón.
    const canjeId = crypto
      .createHash("sha256")
      .update(JSON.stringify([uid, solicitudId]))
      .digest("hex");

    const canjeRef = db.collection("canjes_recompensas").doc(canjeId);

    return db.runTransaction(async (transaction) => {
      // 3. Si este canje ya se procesó, devolverlo sin cobrar otra vez.
      const canjeExistente = await transaction.get(canjeRef);

      if (canjeExistente.exists) {
        const anterior = canjeExistente.data();

        if (
          !anterior.usuario_ref ||
          anterior.usuario_ref.path !== usuarioRef.path ||
          !anterior.recompensa_ref ||
          anterior.recompensa_ref.path !== recompensaRef.path
        ) {
          error(
            "failed-precondition",
            "Esta solicitud ya fue utilizada para otro canje.",
          );
        }

        return canjeId;
      }

      // Todas las lecturas se realizan antes de escribir.
      const usuarioSnap = await transaction.get(usuarioRef);
      const recompensaSnap = await transaction.get(recompensaRef);

      if (!usuarioSnap.exists) {
        error("not-found", "No se encontró tu perfil de usuario.");
      }

      if (!recompensaSnap.exists) {
        error("not-found", "La recompensa ya no existe.");
      }

      const usuario = usuarioSnap.data();
      const recompensa = recompensaSnap.data();

      // 4. Validar disponibilidad y datos de la recompensa.
      if (recompensa.archivada !== false) {
        error("failed-precondition", "La recompensa no está disponible.");
      }

      const costo = recompensa.costo_puntos;
      const saldo = usuario.puntos_disponibles;
      const stockLimitado = recompensa.stock_limitado;
      const stock = recompensa.stock_disponible;
      const tipo = recompensa.tipo;

      if (!Number.isSafeInteger(costo) || costo <= 0) {
        error("failed-precondition", "La recompensa tiene un costo inválido.");
      }

      if (!Number.isSafeInteger(saldo) || saldo < 0) {
        error("failed-precondition", "Tu saldo de puntos no es válido.");
      }

      if (tipo !== "objeto" && tipo !== "descuento") {
        error("failed-precondition", "El tipo de recompensa no es válido.");
      }

      if (
        typeof recompensa.nombre !== "string" ||
        recompensa.nombre.trim().length === 0
      ) {
        error("failed-precondition", "La recompensa no tiene nombre.");
      }

      if (typeof stockLimitado !== "boolean") {
        error("failed-precondition", "La configuración de stock no es válida.");
      }

      let porcentaje = 0;

      if (tipo === "descuento") {
        porcentaje = recompensa.porcentaje_descuento;

        if (
          !Number.isSafeInteger(porcentaje) ||
          porcentaje < 1 ||
          porcentaje > 100
        ) {
          error(
            "failed-precondition",
            "El descuento debe ser un entero entre 1 y 100.",
          );
        }
      }

      if (stockLimitado) {
        if (!Number.isSafeInteger(stock) || stock < 0) {
          error("failed-precondition", "El stock no es válido.");
        }

        if (stock === 0) {
          error("failed-precondition", "La recompensa está agotada.");
        }
      }

      if (saldo < costo) {
        error("failed-precondition", "No tenés puntos suficientes.");
      }

      // 5. Descontar puntos.
      transaction.update(usuarioRef, {
        puntos_disponibles: saldo - costo,
      });

      // 6. Reservar una unidad para este cupón.
      if (stockLimitado) {
        transaction.update(recompensaRef, {
          stock_disponible: stock - 1,
        });
      }

      // 7. Crear el cupón con las condiciones adquiridas.
      transaction.create(canjeRef, {
        usuario_ref: usuarioRef,
        recompensa_ref: recompensaRef,
        nombre_recompensa: recompensa.nombre,
        tipo_recompensa: tipo,
        condiciones:
          typeof recompensa.condiciones === "string"
            ? recompensa.condiciones
            : "",
        porcentaje_descuento: porcentaje,
        puntos_gastados: costo,
        estado: "pendiente",
        fecha_canje: admin.firestore.FieldValue.serverTimestamp(),
        fecha_utilizacion: null,
        validado_por: null,
      });

      return canjeId;
    });
  });
