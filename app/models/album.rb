module Tchotchke
  class Album
    class << self

      # Search for albums based on name
      def search(album)
        LastFM::Api::Album.search(:album => album)
      rescue LastFM::LastFMError => e
      end

      # Get album details for given artist's album
      def get_info(artist, album)
        LastFM::Api::Album.get_info(:artist => artist, :album => album)
      rescue LastFM::LastFMError => e
      end

    end
  end
end
