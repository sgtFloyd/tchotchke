function emptySearchResults() {
  $('#artist_results .result_content').empty();
  $('#album_results .result_content').empty();
  $('#track_results .result_content').empty();
};

function hideAndEmptyInfoPanes() {
  $('.middle, .right').hide();
  $('.content .middle, .content .right').empty();
};

function searchAll(e) {
  var query = $('#search #query').val();
  emptySearchResults();
  hideAndEmptyInfoPanes();
  artSearch(query);
  albSearch(query);
  traSearch(query);
  e.preventDefault();
  return false;
};

// search artists by name, and put results in search pane
function artSearch(artist) {
  $('#artist_results').show().addClass('loading');
  $.ajax({
    url: '/art/'+artist,
    cache: false,
    success: function(html){
      $('#artist_results').removeClass('loading');
      $('#artist_results .result_content').html(html);
      $('.artist_result').click(function() {
        artInfo($(this).text());
      });
    }
  });
};

// search albums by name, and put results in search pane
function albSearch(album) {
  $('#album_results').show().addClass('loading');
  $.ajax({
    url: '/alb/'+album,
    cache: false,
    success: function(html){
      $('#album_results').removeClass('loading');
      $('#album_results .result_content').html(html);
      $('.album_result').click(function() {
        albInfo($(this).text());
      });
    }
  });
};

// search tracks by name, and put results in search pane
function traSearch(track) {
  $('#track_results').show().addClass('loading');
  $.ajax({
    url: '/tra/'+track,
    cache: false,
    success: function(html){
      $('#track_results').removeClass('loading');
      $('#track_results .result_content').html(html);
      $('.track_result').click(function() {
        traInfo($(this).text());
      });
    }
  });
};

// collect info on an artist, and fill in info panes
function artInfo(artist) {
  hideAndEmptyInfoPanes();
  $('.middle').show();
  $('.content .middle').addClass('loading');
};

// collect info on an album, and fill in info panes
function albInfo(album) {
  hideAndEmptyInfoPanes();
  $('.middle, .right').show();
  $('.content .middle, .content .right').addClass('loading');
};

// collect info on an track, and fill in info panes
function traInfo(track) {
  hideAndEmptyInfoPanes();
  $('.middle, .right').show();
  $('.content .middle, .content .right').addClass('loading');
};

$(document).ready(function() {
  // intercept search box
  $('#search').submit(searchAll);
});