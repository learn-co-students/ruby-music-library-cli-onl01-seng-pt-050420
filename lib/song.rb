class Song
  attr_accessor :name, :artist, :genre
  @@all = []
  extend Concerns::Findable
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = Song.new(name)
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
 
def self.new_from_filename(file)
  parts = file.split(" - ")
  aname = parts[0] 
  sname = parts[1]
  gname = parts[2].gsub(".mp3", "")
  
  artist = Artist.find_or_create_by_name(aname)
  genre = Genre.find_or_create_by_name(gname)
 
  new(sname, artist, genre)
  
end

def self.create_from_filename(file)
  new_from_filename(file).save
  
end
end