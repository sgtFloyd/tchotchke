require 'services/lastfm'

module LastFM
  class Radio
    class << self

      TYPE = 'radio'

      # see: http://www.last.fm/api/show?service=256
      def get_playlist( discovery = nil, rtp = nil, buylinks = nil, speed_multiplier = nil, bitrate = nil )
        raise ArgumentError unless [1.0, 2.0].include?(speed_multiplier) && [64, 128].include?(bitrate)
        Services::LastFM.requires_authentication
        Services::LastFM.get( "#{TYPE}.getPlaylist", :secure, 'discovery'=>discovery, 'rtp'=>rtp, 'buylinks'=>buylinks, 'speed_multiplier'=>speed_multiplier, 'bitrate'=>bitrate )
      end

      # see: http://www.last.fm/api/show?service=418
      def search( name )
        Services::LastFM.get( "#{TYPE}.search", !:secure, 'name'=>name )
      end

      # see: http://www.last.fm/api/show?service=160
      def tune( station, lang = nil )
        Services::LastFM.requires_authentication
        Services::LastFM.post( "#{TYPE}.tune", 'station'=>station, 'lang'=>lang )
      end

    end
  end 
end