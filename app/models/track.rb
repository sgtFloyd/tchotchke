module Tchotchke
  class Track
    class << self

      # Search for tracks based on name
      def search(track)
        LastFM::Api::Track.search(:track => track)
      rescue LastFM::LastFMError => e
      end

      # Get track details for given artist's track
      def get_info(artist, track)
        LastFM::Api::Track.get_info( :artist => artist, :track => track )
      rescue LastFM::LastFMError => e
      end

    end
  end
end
