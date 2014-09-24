$(document).ready(function(){
 console.log("signup js loaded baby!");
 loadValidations();
});

var loadValidations = function(){
  $("#new_user").validate({
    debug: false,
    rules: {
      "user[email]": {required: true, email: true, remote: "/validate_input/email"},
      "user[name]": {required: true},
      "user[username]": {required: true,  alphanumeric: true, remote: "/validate_input/username"},
    },
    messages: {
      "user[email]": {
        required: "Email required for our <a href='/faq'>passwordless login</a>.",
        email: "Doesn't look like a valid email.",
        remote: "This email is already registered."
      },
      "user[name]": {
        required: "Name required.",
      },
      "user[username]": {
        required: "Username required. You can change it later.",
        alphanumeric: "Invalid username! Alphanumerics only.",
        remote: "This username is taken."
      }
    }
  });
}
