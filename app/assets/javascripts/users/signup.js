$(document).ready(function(){
 console.log("signup js loaded baby!");
 loadValidations();
});

function loadValidations(){
  $("#new_user").validate({
    debug: false,
    rules: {
      "user[email]": {required: true, email: true, remote: "/validate_input/email"},
      "user[name]": {required: true},
      "user[username]": {required: true, remote: "/validate_input/username"},
    },
    messages: {
      "user[email]": {
        required: "Email address is required for our passwordless login stystem",
        email: "Your email address must be in the format of name@domain.com",
        remote: "This email is taken"
      },
      "user[name]": {
        require: "Name is required to signup. It will be displayed as name @username",
      },
      "user[username]": {
        required: "Username required to signup. It will be displayed as name @username",
        remote: "This name is taken"
      }
    }
  });
}
