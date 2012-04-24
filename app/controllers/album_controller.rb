
get '/album/search/:album' do
  pass unless request.xhr?
  haml :album_results, locals: { albums: LastFM::Api::Album.search(:album => params[:album], :limit => 10) }
end
