require 'services/lastfm'

module LastFM
  class Artist
    class << self

      TYPE = 'artist'

      # see: http://www.last.fm/api/show/?service=303
      def add_tags( artist, tags )
        Services::LastFM.requires_authentication
        raise NotImplementedError
        # Requires HTTP POST
      end

      # see: http://www.last.fm/api/show/?service=446
      def get_correction( artist )
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=117
      def get_events( artist = nil, mbid = nil, autocorrect = nil, festivals_only = nil, limit = nil, page = nil)
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=407
      def get_images( artist = nil, mbid = nil, autocorrect = nil, order = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=267
      def get_info( artist = nil, mbid = nil, lang = nil, autocorrect = nil, username = nil )
        raise ArgumentError unless artist || mbid
        params = {}
        params['artist'] = artist if artist
        params['mbid'] = mbid unless artist
        params['autocorrect'] = '1' if autocorrect
        params['lang'] = lang if lang
        params['username'] = username if username
        Services::LastFM.get( "#{TYPE}.getInfo", !:secure, params )
      end

      # see: http://www.last.fm/api/show/?service=428
      def get_past_events( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=118
      def get_podcast( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=397
      def get_shouts( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=119
      def get_similar( artist = nil, mbid = nil, autocorrect = nil, limit = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=318
      def get_tags( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=287
      def get_top_albums( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=310
      def get_top_fans( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=288
      def get_top_tags( artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=277
      def get_top_tracks( artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=315
      def remove_tag( artist, tag )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=272
      def search( artist, limit = nil, page = nil )
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=306
      def share( artist, recipient, message = nil, publicize = nil )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show/?service=408
      def shout( artist, message )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

    end
  end
end