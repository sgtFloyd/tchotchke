module Tchotchke
  class Artist
    class << self

      # Search for artists based on name
      def search(artist)
        LastFM::Api::Artist.search(:artist => artist, :limit => 10)
      rescue LastFM::LastFMError => e
      end

      # Get the top albums for a given artist
      def get_albums(artist)
        LastFM::Api::Artist.get_top_albums(:artist => artist, :limit => 16)
      rescue LastFM::LastFMError => e
      end

      # Get artists similar to given artist
      def get_similar(artist)
        LastFM::Api::Artist.get_similar(:artist => artist, :limit => 16)
      rescue LastFM::LastFMError => e
      end

    end
  end
end
