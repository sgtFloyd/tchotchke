class Album

  # Last.fm metadata: name, artist, id, mbid, url, release date, image small,
  # image medium, image large, image extra large, image mega, listeners,
  # playcount, tracks, tags, wiki summary, wiki content

  # Important metadata: name, artist, tracks, mbid

  # Get metadata based on album name.
  def self.get_info(album_name)
    #LastFM::Album.get_info
    #Return Album object populated with metadata
  end

  # Search for albums based on name, returns matches sorted by relevance
  def self.search(album_name)
    #LastFM::Album.search
    #Return Album objects populated with metadata
  end

end