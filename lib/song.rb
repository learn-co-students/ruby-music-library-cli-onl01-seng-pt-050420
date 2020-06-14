class Song
    attr_accessor :name, :artist 

    @@all = []
    def initialize(name, artist = 0)
        @name = name 
        @@all = [] 
        @artist = artist 
       
    end 

  def self.all
    @@all
  end 

  def self.destroy_all
    self.all.clear
  end 

  def save
    @@all << self 
  end 

  def self.create(name)
    song = Song.new(name)               #why did this code work to initialize, saves, and returns the song?
    song.save
    song
    
  end

  
end 