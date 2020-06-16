# class Artist
# attr_accessor :name, :songs

# @@all = []

# def initialize(name, songs = nil, genres = nil)
#     @name = name
#     @songs = []
#     save
# end

# def add_song(song)
#   if song.artist == nil
#    song.artist = self
#    @songs << song
#   end
# end

# def genres
#     # self.songs.collect {|song| song.genre}
#     songs.collect { |song| song.genre}.uniq
#   end

#   def songs
#     @songs
#   end




# def self.all
#     @@all
# end

# def self.destroy_all
#     @@all.clear
# end

# def save
#     @@all << self
# end

# def self.create(created_artist)
#     @name = created_artist
#     @@all << created_artist
#     created_artist
# end


# end

require 'pry'
# require_relative "../config/environment.rb"

class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # self.save
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

      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
      # @songs.uniq!

  end

  def genres
    # self.songs.collect {|song| song.genre}
    songs.collect { |song| song.genre}.uniq
  end
end
