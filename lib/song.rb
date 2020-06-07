

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

  #attributes
  attr_accessor :name
  attr_reader :artist

  #instance methods
  def initialize(name, artist = artist) #hook method representing self
    @name = name
    # invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    artist ? self.artist = artist : artist
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  # def artist
  #   @artist
  # end


end
