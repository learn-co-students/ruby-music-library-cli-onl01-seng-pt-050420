class Artist
    attr_accessor :name, :songs
   

    @@all = []
    def initialize(name)
        @name = name 
        @@all = [] 
        @songs = []      #artist has many song
       
    end 

  def self.all
    @@all
  end 

  def self.destroy_all
    self.all.clear
  end 

  def save
    @@all << self 
  end 

  def self.create(name)
    artist = Artist.new(name)               #why did this code work to initialize, saves, and returns the song?
    artist.save
    artist  
  end

  def songs 
    @songs      #returns artist's songs collection
  end 

  def add_song(song)
    if song.arist == nil
        song.artist = self 
    else
        nil
    end 
  end

# def add_song(song)
#     if song.artist == nil
#       song.artist = self
#     else
#       nil
#     end
#     if @songs.include?(song)
#       nil
#     else
#       @songs << song
#     end
#     song
#   end
end 