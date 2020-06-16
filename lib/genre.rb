class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs


    @@all = []
    def initialize(name)
        @name = name 
        @save       #we always want to save or @@all << self in initialize so we are sure to add them to @@all
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

  def artists
    # songs.collect(&:genre).uniq  #is the same as the code below
    songs.collect{|song| song.artist}.uniq
  end 

end 