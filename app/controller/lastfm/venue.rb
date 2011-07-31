require 'services/lastfm'

module LastFM
  class Venue
    class << self

      # see: http://www.last.fm/api/show?service=394
      def get_events( venue, festivals_only = nil )
      end

      # see: http://www.last.fm/api/show?service=395
      def get_past_events( venue, festivals_only = nli, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=396
      def search( venue, country = nil, limit = nil, page = nil )
      end

    end
  end 
end