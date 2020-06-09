require_relative 'artist.rb'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end
  def self.all 
    @@all
  end
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    
  end
  def save
    @@all << self 
  end
  def self.destroy_all 
    @@all.clear
  end
  def self.create(name)
    n_song = self.new(name)
    n_song.save
    n_song
  end
  def self.find_by_name(title)
    @@all.detect {|song|song.name == title}
  end
  def self.find_or_create_by_name(title)
    find_by_name(title) || create(title)
  end
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    a_name = parts[0]
    s_name = parts[1]
    g_name = parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(a_name)
    genre = Genre.find_or_create_by_name(g_name)
    new(s_name, artist, genre)
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
    
end