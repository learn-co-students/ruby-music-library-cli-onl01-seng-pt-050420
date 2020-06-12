
class Genre
   
    attr_accessor :name, :songs
    @@all=[]
  def initialize(name)
     @name=name
     @songs = [] 
          
  end
  extend Concerns::Findable
     def save
         @@all << self
     end
     
     def Genre.all
    @@all 
     end
 
     def Genre.destroy_all
     self.all.clear
     end
 
    def Genre.create(name)
      cat = Genre.new(name)
      cat.save
     #songs << cat if !songs.include?(cat)
     cat
   end
   
   def artists
    songs.collect {|song| song.artist}.uniq
   end
 end