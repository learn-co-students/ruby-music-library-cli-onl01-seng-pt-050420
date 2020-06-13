class Artist
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
        artist = Artist.new(name)
      
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
        # Song.all.select{|song| song.artist == self}
    end
    def add_song(song)
        
        song.artist = self unless song.artist
        songs << song unless songs.include?(song)
        
                
    end
    def genres
       @genres = Song.all.collect{|song| song.genre}
       @genres.uniq
        
        
    end

   
end