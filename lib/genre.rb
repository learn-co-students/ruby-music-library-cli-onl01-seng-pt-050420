


class Genre

  extend Concerns::Findable

  #class variables
  @@all = []

  #class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  #attributes
  attr_accessor :name, :songs


  #instance methods
  def initialize(name) #hook method representing self
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def artists
    songs.map { |song| song.artist  }.uniq
  end

end
