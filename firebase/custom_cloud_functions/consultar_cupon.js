const functions = require("firebase-functions");
const admin = require("firebase-admin");

// FlutterFlow inicializa Firebase Admin.

exports.consultarCupon = functions
  .runWith({ timeoutSeconds: 30 })
  .https.onCall(async (data, context) => {
    if (!context.auth || !context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Debés iniciar sesión.",
      );
    }

    const db = admin.firestore();

    // Comprobar el rol del usuario autenticado.
    const personalSnap = await db
      .collection("Users")
      .doc(context.auth.uid)
      .get();

    if (!personalSnap.exists || personalSnap.data().rol !== "administrador") {
      throw new functions.https.HttpsError(
        "permission-denied",
        "Solo los administradores pueden validar cupones.",
      );
    }

    const canjeId =
      data && typeof data.canjeId === "string" ? data.canjeId.trim() : "";

    // Los cupones generados por canjearRecompensa
    // tienen un ID hexadecimal de 64 caracteres.
    if (!/^[a-f0-9]{64}$/.test(canjeId)) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "El código no corresponde a un cupón válido.",
      );
    }

    const canjeSnap = await db
      .collection("canjes_recompensas")
      .doc(canjeId)
      .get();

    if (!canjeSnap.exists) {
      throw new functions.https.HttpsError(
        "not-found",
        "No se encontró el cupón.",
      );
    }

    const canje = canjeSnap.data();

    return {
      canjeId: canjeSnap.id,
      nombre:
        typeof canje.nombre_recompensa === "string"
          ? canje.nombre_recompensa
          : "",
      condiciones:
        typeof canje.condiciones === "string" ? canje.condiciones : "",
      estado: typeof canje.estado === "string" ? canje.estado : "desconocido",
      tipo:
        typeof canje.tipo_recompensa === "string" ? canje.tipo_recompensa : "",
      porcentaje: Number.isSafeInteger(canje.porcentaje_descuento)
        ? canje.porcentaje_descuento
        : 0,
    };
  });
