class MusicImporter

    def initialize(path)
        @path = path
    end
    def path
      uri = URI.parse(@path)
      
    end
end