class Artist
    extend Concerns::Findable

    attr_accessor :name, :songs
    attr_writer
    attr_reader

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
        Artist.new(name)
    end

    def songs
        @songs
    end

    def add_song(song)
     song.artist = self unless song.artist 
        @songs << song unless @songs.include?(song)
    end
           
        


       
    

    def genres
        Song.all.collect {|song| song.genre if song.artist == self}.uniq
    end


    
    def save
        @@all << self
    end

end