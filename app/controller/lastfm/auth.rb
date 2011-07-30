require 'services/lastfm'

module LastFM
  class Auth
    class << self

      # see: http://www.last.fm/api/show?service=266
      def get_mobile_session( username, auth_token )
      end
    
      # see: http://www.last.fm/api/show?service=125
      def get_session( token )
      end
    
      # see: http://www.last.fm/api/show?service=265
      def get_token()
      end

    end
  end
end