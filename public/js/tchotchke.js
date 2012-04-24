function emptySearchResults() {
  $('#artist_results .content').empty();
  $('#album_results .content').empty();
  $('#track_results .content').empty();
};

function highlightSearchResult(element) {
  $('.result').removeClass('highlight');
  element.closest('.result').addClass('highlight');
};

// hide and empty middle and right panes
function hideInfoPanes() {
  $('.middle, .right').addClass('hidden');
};

// un-hide the given panes and show the loading animation in them
function showPanes(panes) {
  $.each(panes, function() {
    //$('.content .'+this).addClass('loading');
    $('.'+this).removeClass('hidden');
  });
};

// search artists, albums, and tracks for the given query,
// and populate the page with the results
function searchAll(e) {
  var query = $('#search #query').val();
  emptySearchResults();
  hideInfoPanes();
  $.each(['artist', 'album', 'track'], function() {
    doSearch(this, query);
  });
  e.preventDefault();
  return false;
};

function doSearch(type, query) {
  $('#'+type+'_results').removeClass('hidden').addClass('loading');
  $.ajax({
    url: '/'+type+'/search/'+query, // GET /artist/search/Madonna
    cache: false,
    success: function(html) {
      $('#'+type+'_results').removeClass('loading');
      $('#'+type+'_results .content').html(html);
      $('.'+type+'_result').click(function() {
        highlightSearchResult($(this));
        getInfo(type, $(this));
      });
    }
  });
};

function getArtistDetails(element) {
  showPanes(['middle']);
  var artist = element.closest('.result').attr('data-artist');
  $('.artist_name').html('|&nbsp;' + artist);
  loadAlbums(artist);
  loadSimilar(artist);
};
function loadAlbums(artist) {
  $('.top_albums').addClass('loading');
  $.ajax({
    url: '/artist/'+artist+'/albums',
    cache: false,
    success: function(html) {
      $('.top_albums').removeClass('loading');
      $('.top_albums .content').html(html);
    }
  });
};
function loadSimilar(artist) {
  $('.similar_artists').addClass('loading');
  $.ajax({
    url: '/artist/'+artist+'/similar',
    cache: false,
    success: function(html) {
      $('.similar_artists').removeClass('loading');
      $('.similar_artists .content').html(html);
    }
  });
};


function getTracks(element) {
  showPanes(['middle', 'right']);
  var artist = element.attr('data-artist');
};

function getInfo(type, element) {
  hideInfoPanes();
  if (type == 'artist') {
    getArtistDetails(element);
  } else if (type == 'album') {
    getArtistDetails(element);
    getTracks(element);
  } else if (type == 'track') {
    getArtistDetails(element);
    getTracks(element);
  }
};

$(document).ready(function() {
  $('#search').submit(searchAll); // intercept search box
});