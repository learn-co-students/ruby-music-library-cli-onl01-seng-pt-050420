class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{path}/*"].collect { |filename| filename.gsub("#{path}/", "")}
  end

  def import # imports all files from the library. Instantiating a new song object for each file
    files.each do |file|
        Song.create_from_filename(file)
    end
end



end