class Artist
    extend Concerns::Findable
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def save
        @@all << self
    end

    def add_song(song)
        if !song.artist
            song.artist = self
        end

        if !@songs.include?(song)
            @songs << song
        end
    end

    def genres
        @songs.collect {|song| song.genre}.uniq
    end

    def self.create(name)
     Artist.new(name).tap {|artist| artist.save}
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end
end