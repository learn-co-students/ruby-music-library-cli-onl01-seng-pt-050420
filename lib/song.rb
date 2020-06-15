class Song
    attr_accessor :name
    attr_reader    :artist, :genre
    # attr_writer  :genre 
    @@all = []
    def initialize(name, artist = nil, genre = nil)
        @name = name 
        @@all = [] 
        self.artist = artist if artist  #spec line 44 
        self.genre = genre if genre
        
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

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end   
   
  def genre=(genre)
    @genre = genre 
  end 
  
end 