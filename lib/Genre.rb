class Genre
    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        Genre.all << self
    end

    def artists
        self.songs.collect{|i| i.artist}.uniq
    end
end