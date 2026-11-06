const functions = require("firebase-functions");
const admin = require("firebase-admin");

// FlutterFlow inicializa Firebase Admin.

exports.utilizarCupon = functions
  .runWith({ timeoutSeconds: 30 })
  .https.onCall(async (data, context) => {
    if (!context.auth || !context.auth.uid) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Debés iniciar sesión.",
      );
    }

    const canjeId =
      data && typeof data.canjeId === "string" ? data.canjeId.trim() : "";

    if (!/^[a-f0-9]{64}$/.test(canjeId)) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "El código del cupón no es válido.",
      );
    }

    const db = admin.firestore();

    const administradorRef = db.collection("Users").doc(context.auth.uid);

    const canjeRef = db.collection("canjes_recompensas").doc(canjeId);

    return db.runTransaction(async (transaction) => {
      // Comprobar el rol actual dentro de la transacción.
      const administradorSnap = await transaction.get(administradorRef);

      if (
        !administradorSnap.exists ||
        administradorSnap.data().rol !== "administrador"
      ) {
        throw new functions.https.HttpsError(
          "permission-denied",
          "Solo los administradores pueden utilizar cupones.",
        );
      }

      const canjeSnap = await transaction.get(canjeRef);

      if (!canjeSnap.exists) {
        throw new functions.https.HttpsError(
          "not-found",
          "No se encontró el cupón.",
        );
      }

      const canje = canjeSnap.data();

      // No volver a registrar una entrega ya procesada.
      if (canje.estado === "utilizado") {
        return "YA_UTILIZADO";
      }

      if (canje.estado !== "pendiente") {
        throw new functions.https.HttpsError(
          "failed-precondition",
          "El cupón no está disponible para utilizar.",
        );
      }

      transaction.update(canjeRef, {
        estado: "utilizado",
        fecha_utilizacion: admin.firestore.FieldValue.serverTimestamp(),
        validado_por: administradorRef,
      });

      return "UTILIZADO";
    });
  });
