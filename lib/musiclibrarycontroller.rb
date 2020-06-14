require 'pry'

class MusicLibraryController
  def initialize(filepath = "./db/mp3s")
    music_importer = MusicImporter.new(filepath)
    music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = gets.strip
    
    if user_input != "exit"
      call
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted_songs
  end

  def list_artists
    sorted_artists = Artist.all.sort{|a,b| a.name <=> b.name}
    sorted_artists.uniq.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    sorted_genres = Genre.all.sort{|a,b| a.name <=> b.name}
    sorted_genres.uniq.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    aritist_songs = Song.all.select{|song| song.artist.name == user_input}
    sorted_songs = aritist_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre_songs = Song.all.select{|song| song.genre.name == user_input}
    sorted_songs = genre_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    sorted_songs = self.list_songs
    user_input = gets.strip
    if user_input.to_i >= 1 && user_input.to_i  < sorted_songs.size
      # selected_song = sorted_songs[user_input.to_i - 1]
      # puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end

end