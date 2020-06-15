class Genre
  extend Concerns::Findable
  
  @@all = []
  
attr_accessor :name
attr_reader :songs
  
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def self.all
      @@all
    end
    
    def save
    self.class.all << self
    end
    
    def self.destroy_all
      all.clear
    end
    
    def self.create(name)
     song = new(name)
     song.save
     song
    end
    
     def artists
      songs.map{|s| s.artist}.uniq
    end
    
end
