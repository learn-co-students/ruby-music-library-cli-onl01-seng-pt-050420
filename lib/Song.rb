class Song
    
attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |e| e.name == name  }
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.split(" - ")
    genre_name = genre_name.gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)

  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap { |e| e.save}
  end
end