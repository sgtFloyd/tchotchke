function searchAll(e) {
  var query = $('#search #query').val();
  artSearch(query);
  albSearch(query);
  traSearch(query);
  e.preventDefault();
  return false;
};

function artSearch(artist) {
  $('#artist_results .result_content').empty();
  $('#artist_results').show().addClass('loading');
  $.ajax({
    url: '/art/'+artist,
    cache: false,
    success: function(html){
      $('#artist_results').removeClass('loading');
      $('#artist_results .result_content').html(html);
    }
  });
};

function albSearch(album) {
  $('#album_results .result_content').empty();
  $('#album_results').show().addClass('loading');
  $.ajax({
    url: '/alb/'+album,
    cache: false,
    success: function(html){
      $('#album_results').removeClass('loading');
      $('#album_results .result_content').html(html);
    }
  });
};

function traSearch(track) {
  $('#track_results .result_content').empty();
  $('#track_results').show().addClass('loading');
  $.ajax({
    url: '/tra/'+track,
    cache: false,
    success: function(html){
      $('#track_results').removeClass('loading');
      $('#track_results .result_content').html(html);
    }
  });
};

$(document).ready(function() {
  // intercept search box
  $('#search').submit(searchAll);
});