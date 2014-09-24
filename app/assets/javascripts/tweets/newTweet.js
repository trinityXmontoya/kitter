$(document).ready(function(){
  var tweetText = $('#tweet-content-text') ;
  tweetText.on("focusin",displayFullForm);
  tweetText.on("focusout",displayFullForm);
  tweetText.bind('keyup',tweetCharCount);
  tweetText.bind('keyup',setContent);
});

var setContent = function(){
  tweet_content = $('#tweet-content-text').text()
  $('input:hidden[id=tweet_content]').val(tweet_content)
}

var displayFullForm = function(){
  if ($(this).text() == 'Meow meow meow...'){
    $(this).empty();
  }
  if ($(this).text().length == 0)
    {
      if( $(this).is(":active") ){
        $('#tweet_box').css('height','235px');
      }
      else { $('#tweet_box').css('height','70px'); }
      $(this).toggleClass('enlarge-form-input');
      $('#tweet_form_options').toggleClass('display-me');
    }
  else if ($(this).is(":focus")) {
    $(this).css('color','black');
  }
  else { $(this).css('color','gray')
        }
}

var tweetCharCount = function(){
  content = $(this).text();
  chars = $('#charCount');
  lim = 140;
  len = content.length;
  chars.text(lim-len);
  if (len>lim) {
    chars.css('color','red');
    allowable = content.substring(0,lim);
    overflow = content.substring(lim);
    new_text = allowable + "<span class='text-over-limit'>" + overflow + "</span>";
    $(this).html(new_text);
    $('input#tweet-submit').attr('disabled','disabled').css('cursor','default')
    setEndOfContenteditable(this)
  }
  else {
    chars.css('color','black');
    $('input#tweet-submit').attr('disabled',false)
  }
}

var setEndOfContenteditable = function(elem){
  var range,selection;
    if(document.createRange)//Firefox, Chrome, Opera, Safari, IE 9+
    {
        range = document.createRange();//Create a range (a range is a like the selection but invisible)
        range.selectNodeContents(elem);//Select the entire contents of the element with the range
        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
        selection = window.getSelection();//get the selection object (allows you to change selection)
        selection.removeAllRanges();//remove any selections already made
        selection.addRange(range);//make the range you have just created the visible selection
    }
    else if(document.selection)//IE 8 and lower
    {
        range = document.body.createTextRange();//Create a range (a range is a like the selection but invisible)
        range.moveToElementText(elem);//Select the entire contents of the element with the range
        range.collapse(false);//collapse the range to the end point. false means collapse to end rather than the start
        range.select();//Select the range (make it the visible selection
    }
}
