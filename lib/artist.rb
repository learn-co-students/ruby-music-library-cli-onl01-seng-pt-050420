


class Artist

  #class variables
  @@all = []

  #class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  #attributes
  attr_accessor :name, :songs


  #instance methods
  def initialize(name) #hook method representing self
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    song.artist == self ? song.artist : song.artist = self
    songs.include?(song) ? songs : songs << song
  end

end
