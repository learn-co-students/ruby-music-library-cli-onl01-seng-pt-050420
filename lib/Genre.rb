class Genre
    extend Concerns::Findable

    attr_accessor :name
    attr_reader 
    attr_writer

    @@all = []

    def initialize(name)
        @name = name
        save
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end
    
    def self.create(name)
        Genre.new(name) 
    end

    def songs
        @songs
    end
    
    def save
        @@all << self
    end

    def artists
        Song.all.collect {|song| song.artist if song.genre == self}.uniq
    
    end

end