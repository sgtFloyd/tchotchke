require 'services/lastfm'

module LastFM
  class Album
    class << self

      TYPE = 'album'

      # @see http://www.last.fm/api/show?service=302
      def add_tags( artist, album, tags )
        Services::LastFM.requires_authentication
        raise NotImplementedError
        # Requires HTTP POST
      end

      # @see http://www.last.fm/api/show?service=429
      def get_buylinks( country, artist = nil, album = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.get( "#{TYPE}.getBuylinks", !:secure, 'country'=>country, 'artist'=>artist, 'album'=>album, 'mbid'=>mbid, 'autocorrect'=>autocorrect  )
      end

      # @see http://www.last.fm/api/show?service=290
      def get_info( artist = nil, album = nil, mbid = nil, lang = nil, autocorrect = nil, username = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.get( "#{TYPE}.getInfo", !:secure, 'artist'=>artist, 'album'=>album, 'mbid'=>mbid, 'lang'=>lang, 'autocorrect'=>autocorrect, 'username'=>username )
      end

      # @see http://www.last.fm/api/show?service=450
      def get_shouts( artist = nil, album = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.get( "#{TYPE}.getShouts", !:secure, 'artist'=>artist, 'album'=>album, 'mbid'=>mbid, 'autocorrect'=>autocorrect, 'limit'=>limit, 'page'=>page )
      end

      # @see http://www.last.fm/api/show?service=317
      def get_tags( artist = nil, album = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.requires_authentication
        Services::LastFM.get( "#{TYPE}.getTags", :secure, 'artist'=>artist, 'album'=>album, 'mbid'=>mbid, 'autocorrect'=>autocorrect )
      end

      # @see http://www.last.fm/api/show?service=438
      def get_top_tags( artist = nil, album = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && album || mbid
        Services::LastFM.get( "#{TYPE}.getTopTags", !:secure, 'artist'=>artist, 'album'=>album, 'mbid'=>mbid, 'autocorrect'=>autocorrect )
      end

      # @see http://www.last.fm/api/show?service=314
      def remove_tag( artist, album, tag )
        Services::LastFM.requires_authentication
        raise NotImplementedError
        # Requires HTTP POST
      end

      # @see http://www.last.fm/api/show?service=357
      def search( album, limit = nil, page = nil )
        Services::LastFM.get( "#{TYPE}.search", !:secure, 'album'=>album, 'limit'=>limit, 'page'=>page )
      end

      # @see http://www.last.fm/api/show?service=436
      def share( artist, album, publicize = nil, message = nil, recipient = nil )
        Services::LastFM.requires_authentication
        raise NotImplementedError
        # Requires HTTP POST
      end

    end
  end
end