class Artist

  # Last.fm metadata: name, mbid, url, image small, image medium, image large
  # image extra large, image mega, streamable, stats playcount, stats listeners
  # similar artists, tags, bio summary, bio content

  # Important metadata: name, mbid, (albums)

  # Get a list of albums ordered by popularity
  def self.get_albums(artist_name)
    #LastFM::Artist.get_top_albums
    #Return Album objects populated with metadata
  end

  # Get metadata based on artist name
  def self.get_info(artist_name)
    #LastFM::Artist.get_info
    #Return Artist object populated with metadata
  end

  def self.get_similar(artist_name)
    #LastFM::Artist.get_similar
    #Return Artist objects populated with metadata
  end

  def self.get_top_tracks(artist_name)
    #LastFM::Artist.get_top_tracks
    #Return Track objects populated with metadata
  end

  def self.search(artist_name)
    #LastFM::Artist.search
    #Return Artist object populated with metadata
  end


  def get_similar
    self.get_similar(self.name)
  end

end
