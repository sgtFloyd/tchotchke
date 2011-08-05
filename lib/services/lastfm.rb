require 'digest/md5'
require 'libxml'
require 'net/http'
require 'yaml'

require 'controller/lastfm/auth'

module Services
  module LastFM
    class << self

      attr_accessor :api_key, :api_secret, :username, :auth_token, :session_key

      HOST = 'ws.audioscrobbler.com'

      # see: http://www.last.fm/api/authspec
      def authenticate!
        raise AuthenticationError, 'Missing authentication property.' unless @api_key && @api_secret && @username && @auth_token
        @session_key ||= ::LastFM::Auth.get_mobile_session( @username, @auth_token ).find_first('session/key').content
      end

      def authenticated?
        !!@session_key
      end

      def load_config
        config = YAML.load_file( "#{$ROOT}/config/lastfm.yml" )
        @api_key = load_config_property( config, 'api_key' )
        @api_secret = load_config_property( config, 'api_secret' )
        @username = load_config_property( config, 'login_username' )
        @auth_token = generate_auth_token( @username, load_config_property(config, 'login_password') )
      end

      def requires_authentication
        raise AuthenticationError, 'LastFM Authentication Required' unless authenticated?
      end

      # Construct full HTTP GET call from params, and load the response into a LibXML Document.
      #
      # @param method [String]  Last.fm api method to call
      # @param secure [Boolean] Whether sign the request with a method signature and session key
      #     (one exception being auth methods, which require a method signature but no session key)
      # @param params [Hash]    Parameters to send, excluding method, api_key, api_sig, and sk
      #
      # @return [LibXML::XML::Document] XML Document of the data contained in the response
      def get( method, secure = false, params = {} )
        response = Net::HTTP.get_response( HOST, generate_path(method, secure, params) )
        xml = LibXML::XML::Parser.string( response.body ).parse
        catch_errors( xml )
        xml
      end

    private

      def catch_errors( data )
        raise LastFMError, data.find_first('error').content if data.root.attributes['status'] == 'failed'
      end

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
          url += "&#{param}=#{params[param]}"
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

class LastFMError < StandardError; end
class AuthenticationError < StandardError; end
class ConfigurationError < StandardError; end
