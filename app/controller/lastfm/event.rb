require 'services/lastfm'

module LastFM
  class Event
    class << self

      TYPE = 'event'

      # @see http://www.last.fm/api/show?service=307
      def attend( event, status )
        Services::LastFM.requires_authentication
        Services::LastFM.post( "#{TYPE}.attend", 'event'=>event, 'status'=>status )
      end
    
      # @see http://www.last.fm/api/show?service=391
      def get_attendees( event, limit = nil, page = nil )
        Services::LastFM.get( "#{TYPE}.getAttendees", !:secure, 'event'=>event, 'limit'=>limit, 'page'=>page )
      end
    
      # @see http://www.last.fm/api/show?service=292
      def get_info( event )
        Services::LastFM.get( "#{TYPE}.getInfo", !:secure, 'event'=>event )
      end
    
      # @see http://www.last.fm/api/show?service=399
      def get_shouts( event, limit = nil, page = nil )
        Services::LastFM.get( "#{TYPE}.getShouts", !:secure, 'event'=>event, 'limit'=>limit, 'page'=>page )
      end
    
      # @see http://www.last.fm/api/show?service=350
      def share( event, recipient, publicize = nil, message = nil )
        Services::LastFM.requires_authentication
        Services::LastFM.post( "#{TYPE}.share", 'event'=>event, 'recipient'=>recipient, 'public'=>publicize, 'message'=>message )
      end
    
      # @see http://www.last.fm/api/show?service=409
      def shout( event, message )
        Services::LastFM.requires_authentication
        Services::LastFM.post( "#{TYPE}.shout", 'event'=>event, 'message'=>message )
      end

    end
  end
end