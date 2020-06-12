class Genre
attr_accessor :name
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
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
    g = Genre.new(name)
    g.save
    g
  end
  def songs
    @songs
  end
  
   def artists
    songs.map do |song|
      song.artist
    end.uniq
  end
end