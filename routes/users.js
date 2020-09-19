var express = require('express');
var router = express.Router();

const userController = require("../controller/usersController");
const authController = require("../controller/authController");


/* GET users listing. */
router.get('/',authController.verifyToken, userController.get);
router.post('/login', userController.login);
router.post('/', userController.create);


module.exports = router;
