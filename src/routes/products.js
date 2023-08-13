const express = require("express");
const router = express.Router();
const products = require("../controllers/productControllers.js");
/*--------------------Rutas de Productos----------------------------------------------*/

router.get("/", products.all);
router.get("/product/:id", products.detalle);
router.get("/search", products.search);

module.exports = router;