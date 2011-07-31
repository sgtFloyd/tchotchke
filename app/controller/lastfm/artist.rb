require 'services/lastfm'

module LastFM
  class Alrtist
    class << self
    
      # see: http://www.last.fm/api/show?service=303
      def add_tags( artist, tags )
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=429
      def get_buylinks( artist = nil, album = nil, mbid = nil, autocorrect = nil, country = nil )
        raise ArgumentError unless artist && album || mbid
      end
    
      # see: http://www.last.fm/api/show?service=290
      def get_info( album = nil, artist = nil, mbid = nil, lang = nil, autocorrect = nil, username = nil )
        raise ArgumentError unless album && artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=450
      def get_shouts( artist = nil, mbid = nil, limit = nil, autocorrect = nil, page = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=119
      def get_similar( artist = nil, mbid = nil, autocorrect = nil, limit = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=318
      def get_tags( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=287
      def get_top_albums( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=310
      def get_top_fans( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=288
      def get_top_tags( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=277
      def get_top_tracks( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
      end
    
      # see: http://www.last.fm/api/show?service=315
      def remove_tag( artist, tag )
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=272
      def search( artist, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show?service=306
      def share( artist, recipient, message = nil, publicize = nil )
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=408
      def shout( artist, message )
        Services::LastFM.requires_authentication
      end

    end
  end
end