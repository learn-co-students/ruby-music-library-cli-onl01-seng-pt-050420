require 'pry'

class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def self.all
        @@all 
    end 

    def self.create(song)
        song = Song.new(song)
        song.save 
        song 
    end 

    def self.destroy_all
        @@all.clear
    end 

    def self.find_by_name(name)
        @@all.detect do |song| 
            song.name == name
        end 
    end 

    def self.find_or_create_by_name(name)
        if !find_by_name(name)
            create(name)
        else 
            find_by_name(name)
        end 
    end 

    def self.new_from_filename(file)
        parsed_file = file.split(" - ")
        new_song_artist = parsed_file[0]
        new_song_name = parsed_file[1]
        new_song_genre = parsed_file[2].split(".mp3").join
        artist = Artist.find_or_create_by_name(new_song_artist)
        genre = Genre.find_or_create_by_name(new_song_genre)
        self.new(new_song_name, artist, genre)
    end 

    def self.create_from_filename(file)
        self.new_from_filename(file).save

    end 
    
    def initialize(name, artist = nil, genre = nil)
        #binding.pry
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil 
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
        genre.add_genre(self)
    end   

end 