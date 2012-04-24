
get '/track/search/:track' do
  pass unless request.xhr?
  haml :results, locals: { type: :track, results: LastFM::Api::Track.search(:track => params[:track], :limit => 10) }
end
