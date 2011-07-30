module Services
  module LastFM
    class << self

      # see: http://www.last.fm/api/authspec
      attr_accessor :api_key, :api_secret, :session_key, :username, :auth_token # auth_token = md5( username + md5(password) )

      def requires_authentication
        raise AuthenticationException, "LastFM Authentication Required"
      end

    end
  end
end

class AuthenticationException < StandardError
end