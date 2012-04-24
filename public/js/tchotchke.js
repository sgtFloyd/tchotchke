function emptySearchResults() {
  $('#artist_results .result_content').empty();
  $('#album_results .result_content').empty();
  $('#track_results .result_content').empty();
};

function highlightSearchResult(element) {
  $('a').removeClass('highlight');
  element.addClass('highlight');
};

// hide and empty middle and right panes
function hideAndEmptyInfoPanes() {
  $('.middle, .right').addClass('hidden');
  $('.content .middle, .content .right').empty();
};

// un-hide the given panes and show the loading animation in them
function showAndLoadPanes(panes) {
  $.each(panes, function() {
    $('.content .'+this).addClass('loading');
    $('.'+this).removeClass('hidden');
  });
};

// search artists, albums, and tracks for the given query,
// and populate the page with the results
function searchAll(e) {
  var query = $('#search #query').val();
  emptySearchResults();
  hideAndEmptyInfoPanes();
  $.each(['artist', 'album', 'track'], function() {
    doSearch(this, query);
  });
  e.preventDefault();
  return false;
};

function doSearch(type, query) {
  $('#'+type+'_results').removeClass('hidden').addClass('loading');
  var callbackFuntion;
  $.ajax({
    url: '/'+type+'/search/'+query, // GET /artist/search/Madonna
    cache: false,
    success: function(html){
      $('#'+type+'_results').removeClass('loading');
      $('#'+type+'_results .result_content').html(html);
      $('.'+type+'_result').click(function() {
        highlightSearchResult($(this));
        getInfo(type, $(this).text());
      });
    }
  });
};

function getInfo(type, query) {
  if (type == 'artist') {
    hideAndEmptyInfoPanes();
    showAndLoadPanes(['middle']);
  } else if (type == 'album') {
    hideAndEmptyInfoPanes();
    showAndLoadPanes(['middle', 'right']);
  } else if (type == 'track') {
    hideAndEmptyInfoPanes();
    showAndLoadPanes(['middle', 'right']);
  }
};

$(document).ready(function() {
  $('#search').submit(searchAll); // intercept search box
});