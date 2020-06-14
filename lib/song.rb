class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    #@artist = artist
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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

  def self.create(name, artist=nil, genre=nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create(name)
    end
    song
  end

  def self.new_from_filename(filename)
    song_parts = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song_parts[0].strip)
    name = song_parts[1]
    genre = Genre.find_or_create_by_name(song_parts[2].strip.gsub(".mp3", ""))
    song = Song.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end