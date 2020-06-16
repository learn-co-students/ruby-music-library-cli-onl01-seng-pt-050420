
require 'pry'
class Song
    attr_accessor :name
    attr_reader    :artist, :genre
    # attr_writer  :genre 
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        @save     #we always want to save or @@all << self in initialize so we are sure to add them to @@all
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

  def self.create(song_name)
    song = Song.new(song_name)               #why did this code work to initialize, saves, and returns the song?
    song.save
    song  
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end   
   
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 

  def self.find_by_name(song_name)
    self.all.find {|song|song.name == song_name}
  end
   
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create(song_name)
    # if song == nil
    #   self.all << song
    # else
    #   self.all  
  end
 
  def self.new_from_filename(name)
    artist, song, genre_name = name.split(' - ')
    fixed_name = genre_name.gsub('.mp3', '')  
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(fixed_name)
    new(song, artist, genre)
  end 
  
  def self.create_from_filename(name)
    new_from_filename(name).save
  end 
end  