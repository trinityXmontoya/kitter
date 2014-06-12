
$(document).ready(function(){
 console.log("signup js loaded baby!");
 $('#signup-back').on('click', loadStep1);
 $('#signup-continue').on('click',loadStep2);
 loadValidations();
});

function loadStep1(){
    showStep(1);
    hideStep(2);
};

function loadStep2(){
    showStep(2);
    hideStep(1);
    setUsername();
};

function showStep(num){
  var step = "#signup-step-"+num;
  $(step).addClass('display-me');
};

function hideStep(num){
  var step = "#signup-step-"+num;
  $(step).removeClass('display-me').addClass('hide-me');
};

function setUsername(){
  var username = $('input#user_name').val();
  $('#entered-username').empty();
  if (username) {
    var message = "Great! We like the username " + username;
    $('#entered-username').text(message);
  }
};

function loadValidations(){
  $("#new_user").validate({
    debug: false,
    rules: {
      "user[email]": {required: true, email: true, remote: "/validate_input/email"},
      "user[name]": {required: true},
      "user[username]": {required: true, remote: "/validate_input/username"},
      "user[website]": {required: false, url: true}
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
      },
      "user[username]": {
        email: "Incorrect format: must include http:// before"
      }
    }
  });
}

