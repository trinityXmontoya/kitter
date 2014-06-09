$(document).ready( function(){
  loadValidations();
});

function loadValidations(){
  $(".edit_user").validate({
    rules: {
      "user[email]": {required: true, email: true, remote: "/validate_input/email"},
      "user[name]": {required: true},
      "user[username]": {required: true, remote: "/validate_input/username"}
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
