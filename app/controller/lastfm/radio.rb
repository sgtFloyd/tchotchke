require 'services/lastfm'

module LastFM
  class Radio
    class << self

      # see: http://www.last.fm/api/show?service=256
      def get_playlist( discovery = nil, rtp = nil, buylinks = nil, speed_multiplier = nil, bitrate = nil )
      end

      # see: http://www.last.fm/api/show?service=418
      def search( name )
      end

      # see: http://www.last.fm/api/show?service=160
      def tune( station, lang = nil )
        Services::LastFM.requires_authentication
      end

    end
  end 
end