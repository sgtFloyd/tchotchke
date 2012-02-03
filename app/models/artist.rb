module Tchotchke
  class Artist

    attr_accessor :mbid, :name, :tags, :albums

    class << self
      def get_info(artist_name)
      end

      # Search for an artist by name, returning a list of artist strings
      def search(artist_name)
        LastFM::Artist.search(artist: artist_name, limit: 10)
          .find('//artist/name').map{|name_node| name_node.content.strip}
      end
    end

    def get_info
      Artist.get_info(self.name)
    end

    def get_similar
    end

    def get_top_albums
    end

    def get_top_tracks
    end

  end
end