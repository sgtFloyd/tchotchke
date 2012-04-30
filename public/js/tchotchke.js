$(document).ready(function() {
  $('#search').submit(searchAll); // intercept search box
});

// search artists, albums, and tracks for the given query,
// and populate the page with the results
function searchAll(e) {
  var query = $('#search #query').val();
  $('.middle, .right').addClass('hidden');
  emptySearchResults();
  doSearch('artist', query);
  doSearch('album', query);
  doSearch('track', query);
  e.preventDefault();
  return false;
};

function emptySearchResults() {
  $('#artist_results .content').empty();
  $('#album_results .content').empty();
  $('#track_results .content').empty();
};

function trimSearchResults() {
  var char_limit = 38;
  $('.result').each(function(i, result){
    var link = $(result).find('a'), text = link.text();
    if (text.length > char_limit)
      link.text(text.substring(0, char_limit));
  });
};

function doSearch(type, query) {
  $('.banner').hide();
  $('#'+type+'_results').removeClass('hidden').addClass('loading');
  data = {}; data[type] = query
  $.ajax({
    url: '/'+type+'/search',
    data: data,
    cache: false,
    success: function(html) {
      $('#'+type+'_results').removeClass('loading');
      $('#'+type+'_results .content').html(html);
      $('.'+type+'_result').click(function() {
        trimSearchResults();
        getInfo(type, $(this));
      });
    }
  });
};

// populate middle and right panes from search results
function getInfo(type, element) {
  if (type == 'artist') {
    getArtistDetails(element);
  } else if (type == 'album') {
    getArtistDetails(element);
    getAlbumDetails(element);
  } else if (type == 'track') {
    getArtistDetails(element);
    getTrackDetails(element);
  }
};

  /////////////////////////////////////////////////////////////////
 //////////////////// artist-specific details ////////////////////
/////////////////////////////////////////////////////////////////

function getArtistDetails(element) {
  $('.right').addClass('hidden');
  $('.middle').removeClass('hidden');
  var artist = element.closest('.result').attr('data-artist');
  $('.artist_name').html('&nbsp;&nbsp;' + artist.substring(0,38));
  loadAlbums(artist);
  loadSimilar(artist);
};

// load albums into .top_albums in middle pane
function loadAlbums(artist) {
  $('.top_albums .content').html('');
  $('.top_albums').addClass('loading');
  $.ajax({
    url: '/artist/albums',
    data: {artist: artist},
    cache: false,
    success: function(html) {
      $('.top_albums').removeClass('loading');
      $('.top_albums .content').html(html);
      $('.top_album').click(function() {
        getAlbumDetails($(this));
      });
    }
  });
};

// load similar artists into .similar_artists in middle pane
function loadSimilar(artist) {
  $('.similar_artists .content').html('');
  $('.similar_artists').addClass('loading');
  $.ajax({
    url: '/artist/similar',
    data: {artist: artist},
    cache: false,
    success: function(html) {
      $('.similar_artists').removeClass('loading');
      $('.similar_artists .content').html(html);
      $('.similar_artist').click(function() {
        getArtistDetails($(this));
      });
    }
  });
};

  ////////////////////////////////////////////////////////////////
 //////////////////// album-specific details ////////////////////
////////////////////////////////////////////////////////////////

function getAlbumDetails(element) {
  $('.middle').removeClass('hidden');
  $('.right').removeClass('hidden');
  var artist = element.closest('.result').attr('data-artist'),
      album = element.closest('.result').attr('data-album');
  $('.album_name').html('&nbsp;&nbsp;' + album.substring(0,38));
  loadTracks(artist, album);
};

function loadTracks(artist, album) {
  $('.tracks .content').html('');
  $('.tracks').addClass('loading');
  $.ajax({
    url: '/album/tracks',
    data: {artist: artist, album: album},
    cache: false,
    success: function(html) {
      $('.tracks').removeClass('loading');
      $('.tracks .content').html(html);
    }
  });
};

  ////////////////////////////////////////////////////////////////
 //////////////////// track-specific details ////////////////////
////////////////////////////////////////////////////////////////

function getTrackDetails(element) {
  $('.middle').removeClass('hidden');
  $('.right').removeClass('hidden');
  var artist = element.closest('.result').attr('data-artist'),
      track = element.closest('.result').attr('data-track');
  loadTracksFromTrack(artist, track)
}

function loadTracksFromTrack(artist, track) {
  $('.album_name').html('&nbsp;&nbsp;');
  $('.tracks .content').html('');
  $('.tracks').addClass('loading');
  $.ajax({
    url: '/track/info',
    data: {artist: artist, track: track},
    cache: false,
    success: function(track) {
      $('.album_name').html('&nbsp;&nbsp;' + track.album.name.substring(0,38));
      loadTracks(artist, track.album.name);
    }
  });
};
