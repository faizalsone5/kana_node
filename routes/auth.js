var express = require('express');
var router = express.Router();

const authController = require("../controller/authController");
const usersController = require('../controller/usersController');

router.post('/api',authController.verifyToken , usersController.testIt);

module.exports = router;
