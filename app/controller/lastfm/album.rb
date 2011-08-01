require 'services/lastfm'

module LastFM
  class Album
    class << self

      # see: http://www.last.fm/api/show?service=302
      def add_tags( artist, album, tags )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=429
      def get_buylinks( artist = nil, album = nil, mbid = nil, autocorrect = nil, country = nil )
        raise ArgumentError unless artist && album || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=290
      def get_info( artist = nil, album = nil, mbid = nil, lang = nil, autocorrect = nil, username = nil )
        raise ArgumentError unless artist && album || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=450
      def get_shouts( artist = nil, mbid = nil, limit = nil, autocorrect = nil, page = nil )
        raise ArgumentError unless artist || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=317
      def get_tags( artist = nil, album = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=438
      def get_top_tags( artist = nil, album = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && album || mbid
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=314
      def remove_tag( artist, album, tag )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=357
      def search( album, limit = nil, page = nil )
        raise NotImplementedError
      end

      # see: http://www.last.fm/api/show?service=436
      def share( artist, album, publicize = nil, message = nil, recipient = nil )
        Services::LastFM.requires_authentication
        raise NotImplementedError
      end

    end
  end
end