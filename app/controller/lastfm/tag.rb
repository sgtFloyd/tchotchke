require 'services/lastfm'

module LastFM
  class Tag
    class << self

      TYPE = 'tag'

      # @see http://www.last.fm/api/show?service=452
      def get_info( tag, lang = nil )
      end

      # @see http://www.last.fm/api/show?service=311
      def get_similar( tag )
      end

      # @see http://www.last.fm/api/show?service=283
      def get_top_albums( tag, limit = nil, page = nil )
      end

      # @see http://www.last.fm/api/show?service=284
      def get_top_artists( tag, limit = nil, page = nil )
      end

      # @see http://www.last.fm/api/show?service=276
      def get_top_tags
      end

      # @see http://www.last.fm/api/show?service=285
      def get_top_tracks( tag, limit = nil, page = nil )
      end

      # @see http://www.last.fm/api/show?service=358
      def get_weekly_artist_chart( tag, time_from = nil, time_to = nil, limit = nil )
      end

      # @see http://www.last.fm/api/show?service=359
      def get_weekly_chart_list( tag )
      end

      # @see http://www.last.fm/api/show?service=273
      def search( tag, limit = nil, page = nil )
      end

    end
  end 
end