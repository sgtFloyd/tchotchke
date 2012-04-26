
require 'haml'
require 'json'
#require 'logger'
require 'rscrobbler'
require 'sass'
require 'sinatra'
require 'yaml'

#$LOGGER = Logger.new('log/tchotchke.log', 'daily')
$CONFIG = YAML.load_file('config/tchotchke.yml')

#LastFM.logger = $LOGGER
LastFM.establish_session do |session|
  session.username    = $CONFIG[:lastfm_username]
  session.auth_token  = $CONFIG[:lastfm_auth_token]
  session.api_key     = $CONFIG[:lastfm_api_key]
  session.api_secret  = $CONFIG[:lastfm_api_secret]
end

set :public_folder, 'public'

get '/' do
  haml :index
end

get '/css/:file.css' do
  sass :"sass/#{params[:file]}"
end

require_relative 'models/artist'
require_relative 'models/album'
require_relative 'models/track'

load 'app/controllers/artist_controller.rb'
load 'app/controllers/album_controller.rb'
load 'app/controllers/track_controller.rb'


