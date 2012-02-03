module Tchotchke
  class Track

    attr_accessor :mbid, :name, :tags, :artist, :album, :track_num, :duration

    class << self
      def get_info(track_name, artist_name)
      end

      def search(track_name)
        LastFM::Track.search(track: track_name, limit: 10)
          .find('//track/name').map{|name_node| name_node.content.strip}
      end
    end

    def get_info
      Track.get_info(self.name, self.artist.name)
    end

    def get_similar
    end

    def get_top_tags
    end

    def scrobble
    end

  end
end