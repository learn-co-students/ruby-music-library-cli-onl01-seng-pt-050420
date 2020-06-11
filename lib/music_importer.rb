
class MusicImporter
  attr_reader :path, :mp3_files
    
    def initialize(path)
        @path = path
        
    end

    def files
        @mp3_files = Dir.glob("#{@path}/*.mp3").map {|f| f.gsub("#{@path}/", "")}
        #binding.pry
    end

    def import
        files.map {|file| Song.create_from_filename(file)}
    end

end