


class Genre

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
  attr_accessor :name


  #instance methods
  def initialize(name) #hook method representing self
    @name = name
  end

  def save
    @@all << self
  end

end
