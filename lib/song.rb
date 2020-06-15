require 'pry'
class Song
    attr_accessor :name
    attr_reader    :artist, :genre
    # attr_writer  :genre 
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        @@all = [] 
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
    find(song_name) || create(song_name)
    # if song == nil
    #   self.all << song
    # else
    #   self.all
  binding.pry
  end
 
   
end 