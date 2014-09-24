$(document).ready( function(){
  loadValidations();
  $('a.user_edit').click(toggleEditUserDivs);
});

var toggleEditUserDivs = function(){
    $('#account').toggle();
    $('#profile').toggle();
};

var loadValidations = function(){
  $("form.account-edit").validate({
    debug: false,
    rules: {
      "user[email]": {required: true, email: true, remote: "/validate_input/email"},
      "user[username]": {required: true, alphanumeric: true, remote: "/validate_input/username"}
    },
    messages: {
      "user[email]": {
        required: "Email address is required for our passwordless login stystem",
        email: "Your email address must be in the format of name@domain.com",
        remote: "This email is taken"
      },
      "user[username]": {
        required: "Username required to signup. It will be displayed as name @username",
        remote: "This username is taken",
        alphanumeric: "Invalid username! Alphanumerics only.",
      }
    }
  });
  $("form.profile-edit").validate({
    debug: false,
    rules: { "user[name]": {required: true}},
    messages: {
      "user[name]": {
        require: "Name is required to signup. It will be displayed as name @username",
      }
    }
  });
}
