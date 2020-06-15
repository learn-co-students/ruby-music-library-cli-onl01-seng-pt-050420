class Genre
    attr_accessor :name, :songs

    @@all = []
    def initialize(name)
        @name = name 
        @@all = [] 
        @songs = []
        
       
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
    genre = Genre.new(name)               #why did this code work to initialize, saves, and returns the song?
    genre.save
    genre
    
  end

end 