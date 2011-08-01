require 'services/lastfm'

module LastFM
  class Auth
    class << self

      TYPE = 'auth'

      # see: http://www.last.fm/api/show?service=266
      def get_mobile_session( username, auth_token )
        response = Services::LastFM.get( "#{TYPE}.getMobileSession", :secure, 'username' => username, 'authToken' => auth_token )
        response.at('key').inner_html # return session key
      end
    
      # see: http://www.last.fm/api/show?service=125
      def get_session( token )
        response = Services::LastFM.get( "#{TYPE}.getSession", !:secure )
        response.at('token').inner_html # return session key
      end
    
      # see: http://www.last.fm/api/show?service=265
      def get_token()
        response = Services::LastFM.get( "#{TYPE}.getToken", !:secure )
        response.at('token').inner_html # return session key
      end

    end
  end
end