const userData = require("../model/Userdata");
const bcrypt = require('bcrypt');
var jwtSecret = require('../config/jwtConfig');
var jwt = require('jsonwebtoken');
module.exports = {
  verifyToken: function (req, res, next) {
    var bearerheader = req.headers['authorization'];
    if (typeof bearerheader !== 'undefined') {
      const bearer = bearerheader.split(' ');
      const bearerToken = bearer[1];
      req.token = bearerToken;
      jwt.verify(req.token, jwtSecret.secret, function (err, authData) {
        if (err) {
          res.send({
            status: 'bad',
            message: 'Invalid Token',
            code: 403
          });
        } else {
          next();
        }
      })
    } else {
      res.send({
        status: 'bad',
        message: 'Invalid Token',
        code: 403
      });
    }
  }
}