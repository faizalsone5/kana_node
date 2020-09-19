const userData = require("../model/Userdata");
const bcrypt = require('bcrypt');
var jwtSecret = require('../config/jwtConfig');
var jwt = require('jsonwebtoken');

//Common Functions
checkRequiredFields = async function (data, cb) {
  if (data.email === '' || !data.email || data.email === undefined) return cb('Email is Required');
  if (data.password === '' || !data.password || data.password === undefined) return cb('password is Required');
  if (data.first_name === '' || !data.first_name || data.first_name === undefined) return cb('first name is Required');
  if (data.last_name === '' || !data.last_name || data.last_name === undefined) return cb('Last name is Required');
  if (data.dob === '' || !data.dob || data.dob === undefined) return cb('dob is Required');
  if (data.gender === '' || !data.gender || data.gender === undefined) return cb('gender is Required');
  if (data.personal_contact === '' || !data.personal_contact || data.personal_contact === undefined) return cb('Personal Contact is Required');
  if (data.alumini_edu1 === '' || !data.alumini_edu1 || data.alumini_edu1 === undefined) return cb('Alumini 1 is Required');
  if (data.alumini_edu2 === '' || !data.alumini_edu2 || data.alumini_edu2 === undefined) return cb('Alumini 2 is Required');
  if (data.profession === '' || !data.profession || data.profession === undefined) return cb('Profession is Required');
  if (data.marital_status === '' || !data.marital_status || data.marital_status === undefined) return cb('Marital Status is Required');
  //Email Validation 
  var isEmailValid = await validateEmail(data.email);
  if (!isEmailValid) return cb('Invalid Email');
  var validateSpouseDetails = await validateSpouse(data);
  console.log('----validateSpouseDetails----', validateSpouseDetails);
  if (!validateSpouseDetails) return cb('Error in Spouse Details');
  var validateVolunteerDetails = await validateVolunteer(data);
  if (!validateVolunteerDetails) return cb('Error in Volunteer Details');
  var validateAddressDetails = await validateAddress(data);
  if (!validateAddressDetails) return cb('Error in Address Details');
  data.marital_status = parseInt(data.marital_status);
  data.member_type = parseInt(data.member_type);
  data.regional_events = parseInt(data.regional_events);
  data.community_service = parseInt(data.community_service);
  data.expert_sessions = parseInt(data.expert_sessions);
  data.charity_fund = parseInt(data.charity_fund);
  data.association_service = parseInt(data.association_service);
  bcrypt.genSalt(jwtSecret.saltRounds, function (err, salt) {
    bcrypt.hash(data.password, salt, function (err, hash) {
      if (err) return cb(err);
      data.password = hash;
      console.log('hashhh', hash);
      cb(null, data)
    });
  });
}
async function validateSpouse(data) {
  //No Validation Required when Marital Status is single or divorced
  if (data.marital_status === 1 || data.marital_status === 3) return true;
  if (data.spouse_email === '' || data.spouse_email === undefined) return false;
  if (data.spouse_first_name === '' || data.spouse_first_name === undefined) return false;
  if (data.spouse_last_name === '' || data.spouse_last_name === undefined) return false;
  if (data.spouse_dob === '' || data.spouse_dob === undefined) return false;
  if (data.spouse_personal_contact === '' || data.spouse_personal_contact === undefined) return false;
  var isEmailValid = await validateEmail(data.spouse_email);
  if (!isEmailValid) return false;
  return true;
}
function validateVolunteer(data) {
  if (data.volunteer_desc === '' || data.volunteer_desc === undefined) return false;
  return true;
}
function validateAddress(data) {
  if (data.address1 === '' || data.address1 === undefined) return false;
  if (data.address2 === '' || data.address2 === undefined) return false;
  if (data.city === '' || data.city === undefined) return false;
  if (data.state === '' || data.state === undefined) return false;
  if (data.country === '' || data.country === undefined) return false;
  if (data.home_town === '' || data.home_town === undefined) return false;
  if (data.grew_town === '' || data.grew_town === undefined) return false;
  return true;
}
function validateEmail(elementValue){      
  var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
  return emailPattern.test(elementValue); 
} 
outputData = function (err, data, cb) {
  if (err) {
    cb({
      status: 'bad',
      message: err
    })
  } else {
    cb({
      status: 'ok',
      data
    });
  }
}
module.exports = {
  get : function(req,res){
      userData.get(req.connection,function(err,rows){
        if(err){
          res.send({status:'bad', message:'Error in fetching records'});
        }
        else{
          res.send(rows);
        }
      })
  },
  login: function (req, res) {
    userData.getByEmailId(req.connection, req.body.email, function (err, rows) {
      console.log('----', rows);
      if (rows.length === 0) return res.send({
        status: 'bad',
        message: 'No email id match'
      });
      console.log('roww', rows[0].password)
      bcrypt.compare(req.body.password, rows[0].password, function (err, result) {
        console.log('----ree', result);
        if (result) {
          const token = jwt.sign({
            id: rows[0].email
          }, jwtSecret.secret, {
            expiresIn: '200s'
          });
          console.log('token', token);
          res.send({
            status: 'ok',
            message: 'Login Success',
            token
          });
        } else {
          res.send({
            status: 'bad',
            message: 'Login Failure'
          });
        }
      });
    })
  },

  create: function (req, res) {
    var data = req.params;
    console.log('data', req.body.email);
    checkRequiredFields(req.body, async function (err, output) {
      console.log('output', output);

      await outputData(err, output, function (data) {
        console.log('---', data);
        // res.send(data);
        if (data.status === 'ok') {
          userData.create(req.connection, data.data, function (err, rows) {
            if (err) {
              console.log('err', err)
              res.send({
                status: 'bad',
                err: err
              })
            } else {
              data['data'].user_id=rows.insertId;
              console.log('---data---',data);
              userData.insertAddress(req.connection, data.data, function (add_err, add_rows) {
                if(add_err){
                  res.send({
                    status: 'bad',
                    err: add_err
                  })
                }
                else{
                  userData.insertVolunteer(req.connection, data.data, function (spouse_err, spouse_rows) {
                    if(spouse_err){
                      res.send({
                        status: 'bad',
                        err: spouse_err
                      })
                    }
                    else{
                      userData.insertOtherDetails(req.connection, data.data, function (spouse_err, spouse_rows) {
                        if(spouse_err){
                          res.send({
                            status: 'bad',
                            err: spouse_err
                          })
                        }
                        else{

                      if(data.data.marital_status===2 || data.data.marital_status===4){
                        userData.insertSpouse(req.connection, data.data, function (other_err, other_rows) {
                          if(other_err){
                            res.send({
                              status: 'bad',
                              err: other_err
                            })
                          }
                          else{
                            res.send({
                              status: 'ok',
                              'message': 'Registration Successful'
                            })
                          }
                        })
                      }
                      else{
                        res.send({
                          status: 'ok',
                          'message': 'Registration Successful'
                        })
                      }
                    }
                  });
                    }
                  })
                }
              })
            }
          })
        } else {
          res.send(data);
        }
      });
    })
  }
}