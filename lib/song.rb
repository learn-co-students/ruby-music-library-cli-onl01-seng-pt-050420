require 'pry'


class Song

  @@all = []

  #class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    artist_file_name = file_name.split(" - ")[0]
    song_file_name = file_name.split(" - ")[1]
    genre_file_name = file_name.split(" - ")[2].sub(/\.[^.]+\z/, '')

    artist_file = Artist.find_or_create_by_name(artist_file_name)
    genre_file = Genre.find_or_create_by_name(genre_file_name)

    new_song_file = self.new(song_file_name, artist_file, genre_file)
    new_song_file
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  #attributes
  attr_accessor :name
  attr_reader :artist, :genre

  #instance methods
  def initialize(name, artist = artist, genre = genre) #hook method representing self
    @name = name
    # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    artist ? self.artist = artist : artist
    # invokes #genre= instead of simply assigning to an @genre instance variable to ensure that associations are created upon initialization
    genre ? self.genre = genre : genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? genre : genre.songs << self
  end



end
