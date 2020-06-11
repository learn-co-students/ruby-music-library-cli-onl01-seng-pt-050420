class Song

    attr_accessor :name, :song
    attr_reader :artist, :genre
    extend Concerns::Findable

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
        new_song = filename.split(" - ")
        song = self.find_or_create_by_name(new_song[1])
        song.genre = Genre.find_or_create_by_name(new_song[2][0...-4])
        song.artist = Artist.find_or_create_by_name(new_song[0])
        song.artist.songs << song unless song.artist.songs.include?(song)
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end


end