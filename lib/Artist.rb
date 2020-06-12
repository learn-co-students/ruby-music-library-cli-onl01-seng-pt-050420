class Artist 

    attr_accessor :name, :songs
    @@all=[]
  def initialize(name)
     @name=name
     save
     @songs = []
     
  end
     extend Concerns::Findable
     def save
         @@all << self
     end
     
     def Artist.all
     @@all 
     end
 
     def Artist.destroy_all
     self.all.clear
     end
 
    def Artist.create(name)
      band = Artist.new(name)
     band
    end

   def add_song(song)
    song.artist = self unless song.artist 
    songs << song unless songs.include?(song) 
    end

    def genres
        songs.map {|song| song.genre}.uniq
    end

 end
