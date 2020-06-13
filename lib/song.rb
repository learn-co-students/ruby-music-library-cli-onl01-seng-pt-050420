class Song
    attr_accessor :name, :artist, :genre
     
    @@all =[]

    def self.all
        @@all
    end
    def self.destroy_all
        @@all.clear
    end
    def self.create(name)
        song = Song.new(name)
    end
    def self.find_by_name(name)
        self.all.detect{|song| song.name == name}
    end
    def self.find_or_create_by_name(name)
     if !self.find_by_name(name)
         self.create(name)
     else
        self.find_by_name(name)

     end
    end
    def self.new_from_filename(filename)
        artist_name = filename.split("-")[0].strip
        song_name = filename.split("-")[1].strip
        genre_name = filename.split("-")[2].gsub(".mp3", "").strip
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name,artist, genre)
        
        
    end
    def self.create_from_filename(filename)
        if self.new_from_filename(filename) == true
        self.create(filename)
        end
    end
    
    def initialize(name, artist=nil, genre = nil)
       
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
        save
    end
    def save
        @@all << self
    end
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        if !@genre.songs.include?(self)
            @genre.songs << self
        end
    end



end