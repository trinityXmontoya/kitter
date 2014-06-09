
$(document).ready(function(){
  console.log("signup js loaded baby!")
  $('input#user_name').on('focusout',checkEmail);
  $('input#user_email').on('focusout',checkUsername);
   $('#signup-back').on('click', loadStep1);
   $('#signup-continue').on('click',loadStep2)
  loadStep2();
});

function checkEmail(){
  console.log('check email js!');
  $('#new_user').validate({
  debug: true,
  rules: {
  'user[email]': {required: true, email: true, remote:'/users/check_email'} }
});
};

function checkUsername(){
 console.log('check username js!');
  $('#new_user').validate({
  debug: true,
  rules: {
  'user[username]': {required: true},}
});
};

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

