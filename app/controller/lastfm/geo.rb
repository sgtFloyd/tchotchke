require 'services/lastfm'

module LastFM
  class Geo
    class << self

      # see: http://www.last.fm/api/show?service=270
      def get_events( location = nil, lat = nil, long = nil, distance = nil, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show?service=421
      def get_metro_artist_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=420
      def get_metro_hype_artist_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=422
      def get_metro_hype_track_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=423
      def get_metro_track_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=424
      def get_metro_unique_artist_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=425
      def get_metro_unique_track_chart( country, metro, time_start = nil, time_end = nil )
      end
    
      # see: http://www.last.fm/api/show?service=426
      def get_metro_weekly_chartlist( metro )
      end
    
      # see: http://www.last.fm/api/show?service=435
      def get_metros( country = nil )
      end
    
      # see: http://www.last.fm/api/show?service=297
      def get_top_artists( country, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show?service=298
      def get_top_tracks( country, location = nil, limit = nil, page = nil )
      end

    end
  end
end