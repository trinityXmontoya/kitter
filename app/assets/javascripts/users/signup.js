$(document).ready(function(){
 console.log("signup js loaded baby!");
 $('form#new_user input[type="button"][value="Next"]').click({step: 2}, loadStep);
 $('form#new_user input[type="button"][value="Back"]').click({step: 1}, loadStep);
 $('input[type="button"]').attr('disabled', 'disabled');
 loadValidations();
});

function loadStep(event){
  var step = event.data.step;
  showStep(step);
  if (step == 1){ hideStep(2); }
  else if (step == 2){
    hideStep(1);
    setUsername();
  }
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
  var form = $("#new_user")
  form.validate({
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
      "user[website]": {
        email: "Incorrect format: must include http:// before"
      }
    }
  });
  $('#new_user input').on('blur', function(){
    if (form.valid()) {
      $('input[type="button"]').attr('disabled', false);
    } else {
      $('input[type="button"]').attr('disabled', 'disabled');
    }
  })

}
