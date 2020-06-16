
class MusicImporter

    attr_reader :path
    def initialize(path)
        @path = path
    end 

    # def files
    #     Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '') }
    # end

    def files
        files = []
        Dir.new(self.path).each  do |file| 
            files << file if file.length > 5
            end 
        files             
    end 

    def import 
        files.each {|x| Song.create_from_filename(x)}
    end 
end 