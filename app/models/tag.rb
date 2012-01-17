class Tag

  attr_accessor :name

  class << self
    def get_info(tag_name)
    end

    def get_top_tags(tag_name)
    end

    def search(tag_name)
    end
  end

  def get_info
    self.get_info(self.name)
  end

  def get_top_albums
  end

  def get_top_artists
  end

  def get_top_tracks
  end

end
