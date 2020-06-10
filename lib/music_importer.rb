class MusicImporter
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
        @mp3_files = Dir.entries(@path)
    end

    def files
        @mp3_files.select {|f| f.length > 3} 
    end

    def import
        @mp3_files.each do |mp3_file|
            if mp3_file.length > 3
                Song.create_from_filename(mp3_file)
            end
        end
    end


end