class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs, :artist
    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
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
  
    def artists
      songs.map { |e| e.artist  }.uniq
    end
  end