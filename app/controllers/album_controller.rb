module Tchotchke
  class AlbumController

    before '/album/*' do
      pass unless request.xhr?
    end

    get '/album/search' do
      search_results = Album.search(params[:album])
      haml :'album/search_results', locals: { albums: search_results }
    end

    get '/album/tracks' do
      album = Album.get_info(params[:artist], params[:album])
      haml :'album/tracks', locals: { tracks: album.tracks }
    end

  end
end
