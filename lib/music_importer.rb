class MusicImporter
    attr_reader :path
    def initialize(path)
        @path = path
    end
    #run below in pry to find(and practice finding) Dir.glob....
    def files
     Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/",'')}
    end

    def import
        files.each { |file| Song.create_from_filename(file)}
end
end
