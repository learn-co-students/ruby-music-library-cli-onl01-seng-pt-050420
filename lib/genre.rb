class Genre
    extend Concerns::Findable
    attr_accessor :name

    @@all =[]

    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def self.create(name)
        genre = Genre.new(name)
      
    end
    
    def initialize(name)
        @name = name
        save
        @songs = []
    end
    def save
        @@all << self
    end
    def songs
        @songs
    end
    def artists
        @artists = Song.all.collect{|song| song.artist}
        @artists.uniq

    end

end