class Artist
  attr_accessor :name

  @@all= []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
      if !song.artist
        song.artist = self
      end
      if !self.songs.include?(song)
        @songs << song
      end
  end
end
