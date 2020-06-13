class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        Artist.all << self
    end

    def add_song(song)
        songs << song unless self.songs.include?(song)
        song.artist = self if song.artist == nil
    end

    def genres
        self.songs.collect{|i| i.genre}.uniq
    end
end