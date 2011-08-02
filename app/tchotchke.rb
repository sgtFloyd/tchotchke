# add lib directory to ruby's search path
$ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
$: << $ROOT + "/lib" << $ROOT + "/app"

require 'services/lastfm'

require 'controller/lastfm/artist'

Services::LastFM.load_config
Services::LastFM.authenticate!

puts LastFM::Artist.get_info( "Cher" )
