const admin = require("firebase-admin/app");
admin.initializeApp();

const canjearRecompensa = require("./canjear_recompensa.js");
exports.canjearRecompensa = canjearRecompensa.canjearRecompensa;
const consultarCupon = require("./consultar_cupon.js");
exports.consultarCupon = consultarCupon.consultarCupon;
const utilizarCupon = require("./utilizar_cupon.js");
exports.utilizarCupon = utilizarCupon.utilizarCupon;
