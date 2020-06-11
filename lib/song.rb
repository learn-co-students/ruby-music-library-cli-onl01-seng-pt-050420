class Song
    #extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
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
        song = Song.new(name)
        song.save
        song
    end

   def self.find_by_name(name)
       @@all.detect{|song| song.name == name}
   end

   def self.find_or_create_by_name(name)
       find_by_name(name) || create(name)
   end

   def self.new_from_filename(file)
       song_data = file.split(" - ")
       artist = song_data[0]
       name = song_data[1]
       genre = song_data[2].gsub(".mp3", "")
       self.new(name, Artist.find_or_create_by_name(artist), Genre.find_or_create_by_name(genre))
   end

   def self.create_from_filename(file)
       self.new_from_filename(file).save
   end

end