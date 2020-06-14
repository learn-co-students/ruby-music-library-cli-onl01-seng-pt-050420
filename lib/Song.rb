require 'pry'

class Song

    attr_accessor :name, :artist, :genre
    attr_reader 
    attr_writer

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save

    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end
    
    def self.create(name)
        Song.new(name) 
    end
    
    def self.find_by_name(name)
        @@all.detect {|song| song.name == name}
    
    end

    def self.create(name)
        Song.new(name)
    
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
        
    end

    def self.new_from_filename(name)
        artist, song, genre_name = name.split(" - ")
        fixed_name = genre_name.gsub(".mp3", "")
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(fixed_name)
        new(song, artist, genre)

      end

      def self.create_from_filename(name)
        self.new_from_filename(name)
      end


    
    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end
   
    def genre=(genre)
        @genre=genre
        
        if genre.songs.include?(self)
        else
            genre.songs << self
        end
        
    end

    
        
    

    def save
        @@all << self
    end





end