
get '/track/search/:track' do
  pass unless request.xhr?
  haml :track_results, locals: { tracks: LastFM::Api::Track.search(:track => params[:track], :limit => 10) }
end
