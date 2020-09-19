module.exports = {
    get: function(con, callback) {
      con.query("SELECT * FROM user", callback)
    },
  
    getByEmailId: function(con, email, callback) {
        console.log('select',email)
      con.query(`SELECT * FROM user WHERE email = '${email}'`, callback)
    },
  
    create: function(con, data, callback) {
      con.query(
        `INSERT INTO user SET 
        email = '${data.email}', 
        password = '${data.password}',
        first_name = '${data.first_name}',
        last_name = '${data.last_name}',
        personal_contact = '${data.personal_contact}',
        dob = '${data.dob}',
        gender = '${data.gender}',
        alumini_edu1 = '${data.alumini_edu1}',
        alumini_edu2 = '${data.alumini_edu2}',
        profession = '${data.profession}',
        marital_status = '${data.marital_status}'`,
        callback
      )
    },
    insertAddress: function(con, data, callback) {
      console.log('data--1',data);
      con.query(
        `INSERT INTO user_address SET 
        user_id = ${data.user_id}, 
        address1 = '${data.address1}',
        address2 = '${data.address2}',
        city = '${data.city}',
        state  = '${data.state}',
        country = '${data.country}',
        home_town = '${data.home_town}',
        grew_town = '${data.grew_town}'`,
        callback
      )
    },
    insertSpouse: function(con, data, callback) {
      console.log('data--2',data);
      con.query(
        `INSERT INTO spouse SET 
        user_id = ${data.user_id}, 
        email = '${data.spouse_email}', 
        first_name = '${data.spouse_first_name}',
        last_name = '${data.spouse_last_name}',
        personal_contact = '${data.spouse_personal_contact}',
        dob = '${data.spouse_dob}',
        profession = '${data.spouse_profession}'`,
        callback
      )
    },
    insertOtherDetails: function(con, data, callback) {
      con.query(
        `INSERT INTO other_details SET 
        user_id = ${data.user_id}, 
        family_name = '${data.family_name}', 
        kuladeivam_temple = '${data.kuladeivam_temple}',
        kammavar_contact1 = '${data.kammavar_contact1}',
        kammavar_contact2 = '${data.kammavar_contact2}',
        member_type = ${data.member_type}`,
        callback
      )
    },
    insertVolunteer: function(con, data, callback) {
      con.query(
        `INSERT INTO volunteer SET 
        user_id = ${data.user_id}, 
        description = '${data.volunteer_desc}',
        regional_events = ${data.regional_events},
        community_service = ${data.community_service},
        association_service = ${data.association_service},
        expert_sessions = ${data.expert_sessions},
        charity_fund = ${data.charity_fund},
        others = '${data.others}'`,
        callback
      )
    }
  }