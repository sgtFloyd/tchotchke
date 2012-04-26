module Tchotchke
  class TrackController

    before '/track/*' do
      pass unless request.xhr?
    end

    get '/track/search' do
      search_results = Track.search(params[:track])
      haml :'track/search_results', locals: { tracks: search_results }
    end

    get '/track/info' do
      content_type :json
      track = Track.get_info(params[:artist], params[:track])
      track.to_json
    end

  end
end
