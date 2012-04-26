module Tchotchke
  class ArtistController

    before'/artist/*' do
      pass unless request.xhr?
    end

    get '/artist/search' do
      search_results = Artist.search(params[:artist])
      haml :artist_results, locals: { artists: search_results }
    end

    get '/artist/albums' do
      top_albums = Artist.get_albums(params[:artist])
      haml :artist_albums, locals: { albums: top_albums }
    end

    get '/artist/similar' do
      similar_artists = Artist.get_similar(params[:artist])
      haml :artist_similar, locals: { artists: similar_artists }
    end

  end
end
