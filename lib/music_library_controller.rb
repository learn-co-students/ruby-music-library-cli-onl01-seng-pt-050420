class MusicLibraryController

    attr_accessor :path

    def initialize(path='./db/mp3s')
        @path = path
        @music = MusicImporter.new(@path)
        @music.import
    end

    def call
        user_input = ""
        until user_input == "exit" do
            puts("Welcome to your music library!")
            puts("To list all of your songs, enter 'list songs'.")
            puts("To list all of the artists in your library, enter 'list artists'.")
            puts("To list all of the genres in your library, enter 'list genres'.")
            puts("To list all of the songs by a particular artist, enter 'list artist'.")
            puts("To list all of the songs of a particular genre, enter 'list genre'.")
            puts("To play a song, enter 'play song'.")
            puts("To quit, type 'exit'.")
            puts("What would you like to do?")
            user_input = gets.chomp.downcase

            case user_input
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
            else
                "Please make a valid selection:"
            end
        end 
    end

    def list_songs
        count = 1
        alphabetized_songs = Song.all.sort! { |a, b|  a.name <=> b.name }
        alphabetized_songs.each do |song|
            puts("#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}")  
            count += 1  
        end
    end

    def list_artists
        count = 1
        artists = Artist.all.collect {|a| a = a.name  }
        alphabetized_artists = artists.uniq.sort! { |a, b|  a <=> b }
        alphabetized_artists.each do |artist|
            puts("#{count}. #{artist}")
            count += 1
        end
    end

    def list_genres
        count = 1
        genres = Genre.all.collect {|s| s = s.name}
        alphabetized_genres = genres.uniq.sort! { |a, b| a <=> b }
        alphabetized_genres.each do |genre|
            puts("#{count}. #{genre}")
            count += 1
        end
    end

    def list_songs_by_artist
        puts("Please enter the name of an artist:")
        user_input = gets.chomp
        count = 1
        if artist = Artist.find_by_name(user_input)
            artist.songs.sort! { |a, b| a.name <=> b.name } 
            artist.songs.each do |song|
                puts("#{count}. #{song.name} - #{song.genre.name}")
                count += 1
            end
        end
    end

    def list_songs_by_genre
        puts("Please enter the name of a genre:")
        user_input = gets.chomp
        count = 1
        if genre = Genre.find_by_name(user_input)
            genre.songs.sort! { |a, b| a.name <=> b.name }
            genre.songs.each do |song|
                puts("#{count}. #{song.artist.name} - #{song.name}")
                count += 1
            end
        end
    end

    def play_song
        puts("Which song number would you like to play?")
        user_input = gets.chomp.to_i
        if user_input <= Song.all.length && user_input >= 1
            index = user_input - 1
            alphabetized_songs = Song.all.sort! { |a, b|  a.name <=> b.name }
            song = alphabetized_songs[index]
            puts("Playing #{song.name} by #{song.artist.name}")
        end
    end


end