require 'digest/md5'
require 'libxml'
require 'net/http'
require 'uri'
require 'yaml'

require 'controller/lastfm/auth'

# @author Gabe Smith
module Services
  module LastFM
    class << self

      attr :api_key, :api_secret, :username, :auth_token, :session_key

      HOST = 'ws.audioscrobbler.com'
      POST_URI = URI.parse("http://#{HOST}/2.0/")
      CONFIG = "#{$ROOT}/config/lastfm.yml"

      # Authenticate the service with login credentials provided in config file. Use
      # mobile authentication to avoid redirecting to the website to log in.
      #
      # @see http://www.last.fm/api/authspec last.fm auth spec
      # @return [String] session key provided from authentication
      def authenticate!
        raise AuthenticationError, 'Missing authentication property.' unless @api_key && @api_secret && @username && @auth_token
        @session_key ||= ::LastFM::Auth.get_mobile_session( @username, @auth_token ).find_first('session/key').content
      end

      # Has the service been authenticated?
      #
      # @return [Boolean] whether the service has been authenticated
      def authenticated?
        !!@session_key
      end

      # Load properties from the config file into instance variables.
      #
      # @raise [ConfigurationError] if the config file is incomplete
      def load_config
        $LOGGER.info( "Loading Last.fm config: #{CONFIG}")
        config = YAML.load_file( CONFIG )
        @api_key = load_config_property( config, 'api_key' )
        @api_secret = load_config_property( config, 'api_secret' )
        @username = load_config_property( config, 'login_username' )
        @auth_token = generate_auth_token( @username, load_config_property(config, 'login_password') )
      end

      # Ensure the service has been authenticated; raise an error if it hasn't.
      #
      # @raise [AuthenticationError] if the service hasn't been authenticated.
      def requires_authentication
        raise AuthenticationError, 'LastFM Authentication Required' unless authenticated?
      end

      # Construct an HTTP GET call from params, and load the response into a LibXML Document.
      #
      # @param [String] method  last.fm api method to call
      # @param [optional, Boolean] secure  whether sign the request with a method signature and session key
      #   (one exception being auth methods, which require a method signature but no session key)
      # @param [Hash] params  parameters to send, excluding method, api_key, api_sig, and sk
      # @return [LibXML::XML::Document] xml document of the data contained in the response
      # @raise [LastFMError] if the request fails
      def get( method, secure = false, params = {} )
        path = generate_path(method, secure, params)
        $LOGGER.info( "Last.fm HTTP GET: #{HOST+path}" )
        response = Net::HTTP.get_response( HOST, path )
        check_status( LibXML::XML::Parser.string( response.body ).parse )
      end

      # Construct an HTTP POST call from params, and check the response status.
      #
      # @param [String] method  last.fm api method to call
      # @param [Hash] params  parameters to send, excluding method, api_key, api_sig, and sk
      # @return [LibXML::XML::Document] xml document of the data contained in the response
      # @raise [LastFMError] if the request fails
      def post( method, params )
        params = complete_params( method, :secure, params )
        $LOGGER.info( "Last.fm HTTP POST: #{POST_URI}, #{params.to_s}" )
        response = Net::HTTP.post_form( POST_URI, params )
        check_status( LibXML::XML::Parser.string( response.body ).parse )
      end

    private

      # Check an XML document for status = failed, and throw a descriptive error if it's found.
      #
      # @param [LibXML::XML::Document] xml  xml document to check for errors
      # @return [LibXML::XML::Document] the xml document if no errors were found
      # @raise [LastFMError] if an error is found
      # @private
      def check_status( xml )
        raise LastFMError, xml.find_first('error').content if xml.root.attributes['status'] == 'failed'
        xml
      end

      # Normalize the parameter list by converting values to a string and removing any nils. Add method,
      # api key, session key, and api signature parameters where necessary.
      #
      # @param [String] method  last.fm api method
      # @param [Boolean] secure  whether to include session key and api signature in the parameters
      # @param [Hash] params  parameters to normalize and add to
      # @return [Hash] complete, normalized parameters
      def complete_params( method, secure, params )
        params.delete_if{|k,v| v.nil? }
        params.each{|k,v| params[k] = params[k].to_s }
        params['method'] = method
        params['api_key'] = @api_key
        params['sk'] = @session_key if authenticated? && secure
        params['api_sig'] = generate_method_signature( params ) if secure
        params
      end

      # Load a property from a config file, or throw an error if it doesn't exist.
      #
      # @param [String] property  key of the property to get the value for
      # @param [Hash] config  hash of yaml config file
      # @return [String] the value loaded from the config
      # @raise [ConfigurationError] if the property doesn't exist or isn't set within the file.
      # @private
      def load_config_property( config, property )
        raise ConfigurationError, "Missing configuration property: #{property}" unless config.include?(property) && config[property]
        config[property]
      end

      # Generate an auth token from given username and password.
      #
      # @param [String] username  username to use
      # @param [String] password  password to use
      # @return [String] md5 digest of the username and password
      # @private
      def generate_auth_token( username, password )
        Digest::MD5.hexdigest( username + Digest::MD5.hexdigest(password) )
      end

      # Generate the path for a particular method call given params.
      #
      # @param [String] method  last.fm method to call
      # @param [Boolean] secure  whether to include session key and api signature in the call
      # @param [optional, Hash] params  parameters to include in the api call
      # @return [String] path for the api call
      # @private
      def generate_path( method, secure, params={} )
        params = complete_params( method, secure, params )
        url = "/2.0/?method=#{params.delete('method')}"
        params.keys.each do |param|
          url += "&#{param}=#{params[param]}"
        end
        url.gsub(/ /, '%20')
      end

      # Generate a method signature based on given parameters.
      #
      # @param [Hash] parameters to combine into a method signature
      # @return [String] method signature based on all the parameters
      # @see http://www.last.fm/api/authspec#8
      # @private
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
