
get '/album/search/:album' do
  pass unless request.xhr?
  haml :album_results, locals: { albums: LastFM::Api::Album.search(:album => params[:album], :limit => 10) }
end

get '/artist/:artist/album/:album/info' do
  pass unless request.xhr?
  haml :album_tracks, locals: { album: LastFM::Api::Album.get_info(:artist => params[:artist], :album => params[:album]) }
end
