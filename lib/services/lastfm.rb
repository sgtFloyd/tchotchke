require 'digest/md5'
require 'hpricot'
require 'net/http'
require 'yaml'

require 'controller/lastfm/auth'

module Services
  module LastFM
    class << self

      # see: http://www.last.fm/api/authspec
      attr_accessor :api_key, :api_secret, :username, :auth_token, :session_key

      HOST = 'ws.audioscrobbler.com'

      def authenticate!
        raise AuthenticationError, 'Missing authentication property.' unless @api_key && @api_secret && @username && @auth_token
        resp = ::LastFM::Auth.get_mobile_session( @username, @auth_token )
        #TODO: @session_key = parse response xml with hpricot
      end

      def authenticated?
        !!@session_key
      end

      def load_config
        config = YAML.load_file( $ROOT + "/config/lastfm.yml")
        @api_key = load_config_property( config, 'api_key' )
        @api_secret = load_config_property( config, 'api_secret' )
        @username = load_config_property( config, 'login_username' )
        @auth_token = generate_auth_token( @username, load_config_property(config, 'login_password') )
      end

      def requires_authentication
        raise AuthenticationException, 'LastFM Authentication Required' unless authenticated?
      end

      def send( method, secure = false, params = {} )
        resp = Net::HTTP.get_response( HOST, generate_path( method, secure, params ) )
        # TODO: find_errors(resp)
        resp
      end

    private

      def load_config_property( config, property )
        raise ConfigurationError, "Missing configuration property: #{property}" unless config.include?(property) && config[property]
        config[property]
      end

      def generate_auth_token( username, password )
        Digest::MD5.hexdigest( username + Digest::MD5.hexdigest(password) )
      end

      def generate_path( method, secure, params )
        params['method'] = method
        params['api_key'] = @api_key
        params['sk'] = @session_key if authenticated? && secure
        params['api_sig'] = generate_method_signature( params ) if secure
        url = "/2.0/?method=#{params.delete('method')}"
        params.keys.each do |param|
          url += "&#{param}=#{params.delete(param)}"
        end
        url
      end

      def generate_method_signature( params )
        str = ''
        params.keys.sort.each do |key|
          str += key + params[key]
        end
        Digest::MD5.hexdigest( str + @api_secret )
      end

    end
  end
end

class AuthenticationError < StandardError; end
class ConfigurationError < StandardError; end