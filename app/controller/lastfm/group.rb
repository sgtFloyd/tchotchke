require 'services/lastfm'

module LastFM
  class Group
    class << self

      # see: http://www.last.fm/api/show?service=259
      def get_hype( group )
      end
    
      # see: http://www.last.fm/api/show/?service=379
      def get_members( group, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show/?service=293
      def get_weekly_album_chart( group, date_from = nil, date_to = nil )
      end
    
      # see: http://www.last.fm/api/show/?service=294
      def get_weekly_artist_chart( group, date_from = nil, date_to = nil )
      end
    
      # see: http://www.last.fm/api/show/?service=295
      def get_weekly_chart_list( group )
      end
    
      # see: http://www.last.fm/api/show/?service=296
      def get_weekly_track_chart( group, date_from = nil, date_to = nil )
      end

    end
  end
end
