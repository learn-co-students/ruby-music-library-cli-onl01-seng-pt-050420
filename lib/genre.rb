# class Genre
# attr_accessor :name, :songs
# @@all = []

# def initialize(name, artist = nil, song = nil)
#    @name = name
#    @songs = []
#    save
# end

# def add_song(song)
#     if song.genre == nil
#      song.genre = self
#      @songs << song
#     end
#   end
  

# def songs
#     @songs
# end

# def self.all
#     @@all
# end

# def self.destroy_all
#     @@all.clear
# end

# def save
#     @@all << self
# end

# def self.create(created_genre)
#     @name = created_genre
#     @@all << created_genre
#     created_genre
# end

# end


class Genre
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs
  
    @@all = []
  
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
      genre = self.new(name)
      genre.save
      genre
    end
  
    def songs
      @songs
    end
  
    def artists
      self.songs.collect {|s| s.artist}.uniq
    end
  end