class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    # Dir.chdir(@path) {| path | Dir.glob("*.mp3")}
  end

  def files 
    Dir.chdir(@path) {| path | Dir.glob("*.mp3")}
  end
  
  def import 
    files.each { |file| Song.create_from_filename(file)} 
  end
end