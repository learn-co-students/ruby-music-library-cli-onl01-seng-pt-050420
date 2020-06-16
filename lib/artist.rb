class Artist
    extend Concerns::Findable
        
    
    attr_accessor :name, :songs
    attr_reader :genres
   

    @@all = []
    def initialize(name)
        @name = name 
        @save   #we always want to save or @@all << self in initialize so we are sure to add them to @@all
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
    song.artist = self unless song.artist   #we use a ..clause, if the value is not nil, it will be true. #unless is a 'guard clause'
    #  if song.artist == nil       #if the song being passed in does not have an artist then
    #     song.artist = self      # assign current artist
    # @song << self     
    #  else
    #     return song.artist      #otherwise don't do anything and simply return the artist that arleady assigned to the song
    #  end 
    songs << song unless songs.include?(song)
    
  end

    def genres
        # songs.collect(&:genre).uniq  #is the same as the code below
        songs.collect{|song| song.genre}.uniq
    end 
    
end 