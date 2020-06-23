class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  attr_reader :songs

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end
  
  # def songs
  #   #@songs
  #   Song.all {|song| song.genre == self}
  # end

  # end
  
  def songs
    #@songs
    Song.all {|song| song.genre == self}
  end

  
  def artists
    #song_list = Song.all {|song| song.genre == self}
    #song_list.map(&:artist).uniq
    songs.map(&:artist).uniq
  end
end