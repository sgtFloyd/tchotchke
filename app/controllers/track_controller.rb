module Tchotchke
  class TrackController

    before '/track/*' do
      pass unless request.xhr?
    end

    get '/track/search' do
      search_results = Track.search(params[:track])
      haml :track_results, locals: { tracks: search_results }
    end

    get '/track/info' do
      content_type :json
      track = Track.get_info(params[:artist], params[:track])
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

  end
end
