# add lib directory to ruby's search path
$ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
$: << $ROOT + "/lib" << $ROOT + "/app"

require 'logger'
require 'services/lastfm'
require 'controller/lastfm/event'

$LOGGER = Logger.new(File.expand_path(File.dirname(__FILE__) + "/../log/tchotchke.log"), 'daily')

Services::LastFM.load_config
Services::LastFM.authenticate!

#puts LastFM::Event.attend( 1950483, 1 )