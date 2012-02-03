module Tchotchke
  class Album

    attr_accessor :mbid, :name, :tags, :artist, :tracks

    class << self
      def get_info(album_name, artist_name)
      end

      def search(album_name)
        LastFM::Album.search(album: album_name, limit: 10)
          .find('//album/name').map{|name_node| name_node.content.strip}
      end
    end

    def get_info
      Album.get_info(self.name, self.artist.name)
    end

    def get_top_tags
    end

  end
end