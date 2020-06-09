


class Artist

  extend Concerns::Findable

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

  def genres
    # returns a collection of genres for all of the artist's songs (artist has many genres through songs)
    # does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
    # collects genres through its songs instead of maintaining its own @genres instance variable (artist has many genres through songs)
    songs.map { |song| song.genre }.uniq
  end

end
