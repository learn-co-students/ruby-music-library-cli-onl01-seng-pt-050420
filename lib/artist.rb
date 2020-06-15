class Artist
  attr_accessor :name, :songs
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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    songs.include?(song) ? nil : @songs << song
  end

  def add_genre(genre)
    song.genre == nil ? song.genre = self : nil
    songs.include?(song) ? nil : @songs << song
  end

  def genres
    @genres_array = []
    @songs.each do |song|
      @genres_array.include?(song.genre) ? nil : @genres_array << song.genre
    end
    @genres_array
  end



end
