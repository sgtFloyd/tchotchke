require 'services/lastfm'

module LastFM
  class User
    class << self

      # see: http://www.last.fm/api/show?service=432
      def get_artist_tracks( user, artist, start_timestamp = nil, end_timestamp = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=448
      def get_banned_tracks( user, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=291
      def get_events( user, limit, page )
      end

      # see: http://www.last.fm/api/show?service=263
      def get_friends( user, recent_tracks = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=344
      def get_info( user = nil )
      end

      # see: http://www.last.fm/api/show?service=329
      def get_loved_tracks( user, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=264
      def get_neighbors( user, limit = nil )
      end

      # see: http://www.last.fm/api/show?service=444
      def get_new_releases( user, useresc = nil )
      end

      # see: http://www.last.fm/api/show?service=343
      def get_past_events( user, limit = nil, page = nil )
      end

      @tagging_types = [ 'artist', 'album', 'track' ]

      # see: http://www.last.fm/api/show?service=455
      def get_personal_tags( user, tag, tagging_type, limit = nil, page = nil )
        raise ArgumentError unless @tagging_types.include?(tagging_type)
      end

      # see: http://www.last.fm/api/show?service=313
      def get_playlists( user )
      end

      # see: http://www.last.fm/api/show?service=414
      def get_recent_stations( user, limit = nil, page = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=278
      def get_recent_tracks( user, time_start = nil, time_end = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=388
      def get_recommended_artists( limit = nil, page = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=375
      def get_recommended_events( limit = nil, page = nil )
        Services::LastFM.requires_authentication
      end

      # see: http://www.last.fm/api/show?service=401
      def get_shouts( user, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=299
      def get_top_albums( user, period = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=300
      def get_top_artists( user, period = nil, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=123
      def get_top_tags( user, limit = nil )
      end

      # see: http://www.last.fm/api/show?service=301
      def get_top_tracks( user, period, limit = nil, page = nil )
      end

      # see: http://www.last.fm/api/show?service=279
      def get_weekly_album_chart( user, time_start = nil, time_end = nil )
      end

      # see: http://www.last.fm/api/show?service=281
      def get_weekly_artist_chart( user, time_start = nil, time_end = nil )
      end

      # see: http://www.last.fm/api/show?service=280
      def get_weekly_chart_list( user )
      end

      # see: http://www.last.fm/api/show?service=282
      def get_weekly_track_chart( user, time_start = nil, time_end = nil )
      end

      # see: http://www.last.fm/api/show?service=411
      def shout( user, message )
        Services::LastFM.requires_authentication
      end

    end
  end 
end