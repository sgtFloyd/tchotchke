class Album

  attr_accessor :mbid, :name, :tags, :artist, :tracks

  class << self
    def get_info(album_name, artist_name)
    end

    def search(album_name)
    end
  end

  def get_info
    self.get_info(self.name, self.artist.name)
  end

  def get_top_tags
  end

end