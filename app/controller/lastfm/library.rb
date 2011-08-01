require 'services/lastfm'

module LastFM
  class Library
    class << self

      # see: http://www.last.fm/api/show?service=370
      def add_album( artist, album )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=371
      def add_artist( artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=372
      def add_track( track, artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=321
      def get_albums( user, artist = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=322
      def get_artists( user, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=323
      def get_tracks( user, artist = nil, album = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=523
      def remove_album( artist, album )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=524
      def remove_artist( artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=525
      def remove_scrobble( track, artist, timestamp )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=526
      def remove_track( track, artist )
        Services::LastFM.requires_authentication
      end

    end
  end 
end