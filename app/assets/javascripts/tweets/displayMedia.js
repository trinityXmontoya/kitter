$(document).ready(function(){
  $('.expand').on('click',showMedia);
  $('.collapse').on('click',hideMedia);
})

var showMedia = function(){
  id = this.getAttribute('data-id');
  $('.each_tweet[data-id='+id+']').addClass('expanded-tweet')
  tweetOpts(id)
}

var hideMedia = function(){
  id = this.getAttribute('data-id');
  $('.each_tweet[data-id='+id+']').removeClass('expanded-tweet')
  tweetOpts(id)
}

var tweetOpts = function(id){
  $('.expand[data-id='+id+']').toggle();
  $('.collapse[data-id='+id+']').toggle();
}
