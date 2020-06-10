require 'pry'

class Song

    attr_accessor :name, :song
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        @genre = genre
        save
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save(song=self)
        @@all << song unless @@all.include?(song)
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.find_by_name(name)
        found = self.all.select {|s| s.name == name}
        found[0]
    end

    def self.find_or_create_by_name(name)
        found = self.find_by_name(name)
        if found == nil
            self.create(name)
        else
            found
        end
    end 

    def artist=(artist)
        @artist = artist
        @artist.songs << self unless @artist.songs.include?(self)
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.all_songs(self)
    end

    def self.new_from_filename(filename)
        #["Thundercat", "For Love I Come", "dance.mp3"]
        new_song = filename.split(" - ")
        song = self.find_or_create_by_name(new_song[1])
        song.genre = Genre.find_or_create_by_name(new_song[2][0...-4])
        song.artist = Artist.find_or_create_by_name(new_song[0])
        song.artist.songs << song unless song.artist.songs.include?(song)
        song
    end

    def self.create_from_filename(filename)
        song = self.new_from_filename(filename)
        song
    end


end