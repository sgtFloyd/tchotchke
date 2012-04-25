
get '/track/search/:track' do
  pass unless request.xhr?
  haml :track_results, locals: { tracks: LastFM::Api::Track.search(:track => params[:track], :limit => 10) }
end

get '/artist/:artist/track/:track/info' do
  pass unless request.xhr?
  content_type :json
  track = LastFM::Api::Track.get_info( :artist => params[:artist], :track => params[:track] )
  { :id => track.id, :mbid => track.mbid,
    :name => track.name,
    :position => track.position,
    :artist => track.artist.name,
    :album => track.album.name,
    :duration => track.duration,
    :listeners => track.listeners,
    :playcount => track.playcount,
    :url => track.url
  }.to_json
end
