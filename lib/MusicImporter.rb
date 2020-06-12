class MusicImporter
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select{|i| !File.directory? i}
    end

    def import
        self.files.each{|i| Song.create_from_filename(i)}
    end
end