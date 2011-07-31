require 'services/lastfm'

module LastFM
  class Playlist
    class << self

      # see: http://www.last.fm/api/show?service=337
      def add_track( playlist_id, artist, track )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=365
      def create( title = nil, description = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=271
      def fetch( playlist_url )
      end

    end
  end 
end