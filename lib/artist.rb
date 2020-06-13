class Artist 
    attr_accessor :name, :song, :genre
    extend Concerns::Findable
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
      artist = self.new(name)
      artist.save 
      artist
    end
    
    def songs 
      @songs
    end
    
    def add_song(song)
      if song.artist == nil
      song.artist = self
      end 
      if @songs.include?(song)
        nil 
      else
      @songs << song
      end
    end
    
    def genres
      @array = []
      @songs.each do |song|
        if !@array.include?(song.genre)    
        @array << song.genre
        end
      end
      @array
    end
  end