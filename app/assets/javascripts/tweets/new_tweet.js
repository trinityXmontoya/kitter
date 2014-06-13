$(document).ready(function(){
  $('#tweet-content-text').on("focusin",displayFullForm);
  $('#tweet-content-text').on("focusout",displayFullForm);
  $('#tweet-content-text').bind('keyup',tweetCharCount);
});

function displayFullForm(){
  if ($(this).text().length == 0)
    {
      $(this).toggleClass('enlarge-form-input');
      $('#tweet_form_options').toggleClass('display-me');
    }
  else if ($(this).is(":focus")) {
    $(this).css('color','black');
  }
  else { $(this).css('color','gray') }
}

function tweetCharCount(){
  tweet_text = $(this).text();
  charCountEl = $('#charCount');
  limit = 140;
  len = tweet_text.length;
  charCountEl.text(140-len);
  if (len>limit) {
    charCountEl.css('color','red');
    allowable = tweet_text.substring(0,limit)
    overflow = tweet_text.substring(limit,len);
    new_text = (allowable + "<span class='text-over-limit'>" + overflow + "</span>");
    $(this).html(new_text);
    $('input#tweet-submit').attr('disabled','disabled').css('cursor','default')
  }
  else {
    $('input#tweet-submit').attr('disabled',false)
  }
}
