class Artist
  attr_accessor :name
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
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
    a = Artist.new(name)
    a.save
    a
  end
 
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    songs.map do |song|
      song.genre
    end.uniq
  end
  
  
end