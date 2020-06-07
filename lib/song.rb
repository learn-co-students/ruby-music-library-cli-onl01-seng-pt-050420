class Song
    attr_accessor :name
    attr_reader :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        if !genre.songs.include?(self)
            @genre = genre
            genre.songs << self
        end 
    end
    
    def save
        @@all << self
    end

    def self.create(name)
        Song.new(name).tap {|song| song.save}
    end

    def self.new_from_filename(filename)
        file = filename.split(" - ")
        self.find_or_create_by_name(file[1]).tap do |song|
            song.artist = Artist.find_or_create_by_name(file[0])
            song.genre = Genre.find_or_create_by_name(file[2].gsub(".mp3",""))
        end
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename)
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || Song.create(name)
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

end