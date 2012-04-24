
get '/album/search/:album' do
  pass unless request.xhr?
  haml :results, locals: { type: :album, results: LastFM::Api::Album.search(:album => params[:album], :limit => 10) }
end
