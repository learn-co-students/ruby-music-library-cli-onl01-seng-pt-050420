class Genre

    attr_accessor :name
    extend Concerns::Findable

    @@all = []

    def self.all
        @@all 
    end 

    def self.create(name)
        genre = Genre.new(name)
        genre.save 
        genre 
    end 

    def self.destroy_all
        @@all.clear
    end 

    def initialize(name)
        @name = name
        @songs = []
    end 

    def save
        @@all << self
    end 

    def songs
        @songs 
    end 

    def add_genre(song)
        if song.genre == nil
            song.genre = self
        else 
            nil 
        end 
        if @songs.include?(song)
            nil 
        else 
            @songs << song
        end 
        song 
    end 

    def artists
        @new_array = []
        @songs.each do |song|
            if @new_array.include?(song.artist)
                nil
            else 
                @new_array << song.artist
            end 
        end 
        @new_array
    end 

end 