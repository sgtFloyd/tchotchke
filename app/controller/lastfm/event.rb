require 'services/lastfm'

module LastFM
  class Event
    class << self

      # see: http://www.last.fm/api/show?service=307
      def attend( event, status )
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=391
      def get_attendees( event, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show?service=292
      def get_info( event )
      end
    
      # see: http://www.last.fm/api/show?service=399
      def get_shouts( event, limit = nil, page = nil )
      end
    
      # see: http://www.last.fm/api/show?service=350
      def share( event, recipient, publicize = nil, message = nil )
        Services::LastFM.requires_authentication
      end
    
      # see: http://www.last.fm/api/show?service=409
      def shout( event, message )
        Services::LastFM.requires_authentication
      end

    end
  end
end