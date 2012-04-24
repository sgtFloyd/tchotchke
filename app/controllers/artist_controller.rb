
get '/artist/search/:artist' do
  pass unless request.xhr?
  haml :artist_results, locals: { artists: LastFM::Api::Artist.search(:artist => params[:artist], :limit => 10) }
end

get '/artist/:artist/albums' do
  pass unless request.xhr?
  haml :artist_albums, locals: { albums: LastFM::Api::Artist.get_top_albums(:artist => params[:artist], :limit => 16) }
end

get '/artist/:artist/similar' do
  pass unless request.xhr?
  haml :artist_similar, locals: { artists: LastFM::Api::Artist.get_similar(:artist => params[:artist], :limit => 16) }
end
