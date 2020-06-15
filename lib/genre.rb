class Genre
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
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    @artists_array = []
    @songs.each do |song|
      @artists_array.include?(song.artist) ? nil : @artists_array << song.artist
    end
    @artists_array
  end

end
