const admin = require("firebase-admin/app");
admin.initializeApp();

const canjearRecompensa = require("./canjear_recompensa.js");
exports.canjearRecompensa = canjearRecompensa.canjearRecompensa;
