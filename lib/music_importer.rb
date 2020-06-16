class MusicImporter
    attr_accessor :path, :mp3_files

    def initialize(file_path)
        @path = file_path
        @mp3_files = Dir.glob("#{@path}/*.mp3").map {|f| f.gsub("#{@path}/", "")}
    end

    def files
        @mp3_files.each {|s| s.gsub(".mp3/""")}
    end

    def import
        files.each {|s| Song.create_from_filename(s)}
    end
end