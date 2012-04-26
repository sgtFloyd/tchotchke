module Tchotchke
  class Artist
    class << self

      # Search for artists based on name
      def search(artist)
        # get any possible corrections for given name
        artists = [artist] + begin
          LastFM::Api::Artist.get_correction(:artist => artist).map(&:name)
        rescue LastFM::LastFMError => e; []; end

        # get search results for all possible corrections
        artists.inject([]){|results, artist|
          begin
            results + LastFM::Api::Artist.search(:artist => artist)
          rescue LastFM::LastFMError => e; results; end

        # only return 'valid' artists - the ones with an mbid
        }.select{|a| !a.mbid.empty?}
      end

      # Get the top albums for a given artist
      def get_albums(artist)
        LastFM::Api::Artist.get_top_albums(:artist => artist)
      rescue LastFM::LastFMError => e
      end

      # Get artists similar to given artist
      def get_similar(artist)
        LastFM::Api::Artist.get_similar(:artist => artist)
      rescue LastFM::LastFMError => e
      end

    end
  end
end
