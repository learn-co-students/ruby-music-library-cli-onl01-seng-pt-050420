class Artist 
  extend Concerns::Findable
attr_accessor :name, :songs, :genres
@@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    self.new(name)
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end 
  
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end
  

end 