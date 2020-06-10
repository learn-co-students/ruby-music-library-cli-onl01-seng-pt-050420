class Genre

    attr_accessor :name
    extend Concerns::Findable

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end
    def all_songs(song)
        @songs << song unless @songs.include?(song)
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        songs = Song.all.select {|s| s.genre == self}
        artists = []
        songs.each do |song|
            artists << song.artist unless artists.include?(song.artist)
        end
        artists
    end
end