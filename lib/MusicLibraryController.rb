class MusicLibraryController
    attr_accessor :path

    def initialize(path="./db/mp3s")
        @path = path
        MusicImporter.new(path).import
    end

    def call
        input = ""
        until input == "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            input = gets.strip

            case input
                when "list songs"
                    list_songs
                when "list artists"
                    list_artists
                when "list genres"
                    list_genres
                when "list artist"
                    list_songs_by_artist
                when "list genre"
                    list_songs_by_genre
                when "play song"
                    play_song
            end # case statement
        end # until statement
    end #call method

    def list_songs
        Song.all.sort{|a, b| a.name <=> b.name}.each_with_index{|v, i| puts "#{i+1}. #{v.artist.name} - #{v.name} - #{v.genre.name}"}
    end

    def list_artists
        Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index{|v, i| puts "#{i+1}. #{v.name}"}
    end

    def list_genres
        Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index{|v, i| puts "#{i+1}. #{v.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.strip
        Song.all.sort{|a, b| a.name <=> b.name}.select{|i| i.artist.name == artist}.each_with_index{|v, i| puts "#{i+1}. #{v.name} - #{v.genre.name}"}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre = gets.strip
        Song.all.sort{|a, b| a.name <=> b.name}.select{|i| i.genre.name == genre}.each_with_index{|v, i| puts "#{i+1}. #{v.artist.name} - #{v.name}"}
    end

    def play_song
        puts "Which song number would you like to play?"
        number = gets.strip.to_i
        if number > 0 && number <= Song.all.length
        Song.all.sort{|a, b| a.name <=> b.name}.each_with_index{|v, i| puts "Playing #{v.name} by #{v.artist.name}" if i == number-1}
        end
    end
end # class MusicLibraryController