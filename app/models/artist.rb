class Artist

  attr_accessor :mbid, :name, :tags, :albums

  class << self
    def get_info(artist_name)
    end

    def search(artist_name)
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
