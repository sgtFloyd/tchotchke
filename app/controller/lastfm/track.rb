require 'services/lastfm'

module LastFM
  class Track
    class << self

      # see: http://www.last.fm/api/show?service=304
      def add_tags( track, artist, tags )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=261
      def ban( track, artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=431
      def get_buylinks( track = nil, artist = nil, mbid = nil, autocorrect = nil, country = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=447
      def get_correction( track, artist )
      end

      # see: http://www.last.fm/api/show?service=441
      def get_fingerprint_metadata( fingerprint_id )
      end

      # see: http://www.last.fm/api/show?service=356
      def get_info( track = nil, artist = nil, mbid = nil, autocorrect = nil, username = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=453
      def get_shouts( track = nil, artist = nil, mbid = nil, autocorrect = nil, limit = nil, page = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=319
      def get_similar( track = nil, artist = nil, mbid = nil, autocorrect = nil, limit = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=320
      def get_tags( track = nil, artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && track || mbid
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=312
      def get_top_fans( track = nil, artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=289
      def get_top_tags( track = nil, artist = nil, mbid = nil, autocorrect = nil )
        raise ArgumentError unless artist && track || mbid
      end

      # see: http://www.last.fm/api/show?service=260
      def love( track = nil, artist = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=316
      def remove_tag( track, artist, tag )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=443
      def scrobble( tracks, artists, timestamps, albums = nil, album_artists = nil, contexts = nil, stream_ids = nil, track_numbers = nil, mbids = nil, durations = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=286
      def search( track, artist = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=449
      def unban( track, artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=440
      def unlove( track, artist )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=454
      def update_now_playing( track, artist, album = nil, album_artist = nil, context = nil, track_number = nil, mbid = nil, duration = nil )
        Services::LastFM.requires_authentication
      end

    end
  end 
end