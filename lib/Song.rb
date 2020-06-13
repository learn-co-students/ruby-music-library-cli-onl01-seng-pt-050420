class Song
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
    end

    def self.find_by_name(name)
        self.all.detect{|i| i.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    end

    def self.new_from_filename(filename)
        att_arr = filename.split(" - ")
        artist_name = att_arr[0]
        song_name = att_arr[1]
        genre_name = att_arr[2].split(".mp3").join
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        song = self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def save
        Song.all << self
    end
end