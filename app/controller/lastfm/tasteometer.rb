require 'services/lastfm'

module LastFM
  class Tasteometer
    class << self

      @types = [ 'user', 'artists', 'myspace' ]

      # see: http://www.last.fm/api/show?service=258
      def compare( type_1, type_2, value_1, value_2, limit = nil )
        raise ArgumentError unless @types.include?(type_1) && @types.include?(type_2)
      end

    end
  end 
end