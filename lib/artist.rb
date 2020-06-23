class Artist 
  extend Concerns::Findable
  attr_accessor :name 
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    self.class.all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
    @@all.clear
  end
  
  def self.create(artist)
    artist = new(artist)
    artist.save
    artist
  end
  
  # def songs
  #   # @songs
  #   Songs.all.select{|song| song.artist == self}
  # end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    # song_list = Song.all.select {|song| song.artist == self}
    # song_list.map(&:genre).uniq # interates through all the artist's songs to find the genre, then only returns unique genres.
    
     songs.map(&:genre).uniq
  end
   
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    song_list = Song.all.select {|song| song.artist == self}
    song_list.map(&:genre).uniq # interates through all the artist's songs to find the genre, then only returns unique genres.
  end
end