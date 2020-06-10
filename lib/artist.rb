class Artist

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

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end
    
    def songs
        @songs
    end

    def add_song(song)
        if song.artist != self && @songs.include?(song) == false
            song.artist = self
            @songs << song unless @songs.include?(song)
        end 
    end
    
    def genres
        songs = Song.all.select {|s| s.artist == self}
        genres = []
        songs.each do |song|
            genres << song.genre unless genres.include?(song.genre)
        end
        genres
    end


end