class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end
  
  def save
    @@all << self  
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    song = Song.new(song)
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
  
  def self.find_by_name(name)
    all.bsearch {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  
  def self.new_from_filename(filename)
    file_parts = filename.split(" - ") #split the file into parts
    
    #labled artist inside the array of file names
    artist_name = file_parts[0]
    song = file_parts[1]
    genre_name = file_parts[2].gsub(".mp3","")
    
    # created or found(avoids duplicates) the artist/genre before creating the new song 
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = Song.new(song, artist, genre)
  end
  
  def self.create_from_filename(file)
    new_from_filename(file).tap{ |s| s.save }
    created = self.new_from_filename(file)

  end
end