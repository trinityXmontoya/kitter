$(document).ready( function(){
  console.log("ready to login baby?");
  usernameSelection();
});

function usernameSelection(){
  // select user to send login link to
  $("input#user_id").on("change", function(){
      var username = $('input#user_id').val();
      console.log(username)
      var newActionLink = "/login/"+ username + "/send_login_link"
      $("#login-form").attr("action", newActionLink)
  });
}
