
get '/artist/search/:artist' do
  pass unless request.xhr?
  haml :results, locals: { type: :artist, results: LastFM::Api::Artist.search(:artist => params[:artist], :limit => 10) }
end
