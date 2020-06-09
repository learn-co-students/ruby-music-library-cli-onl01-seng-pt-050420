module Concerns::Findable
  def find_by_name(item)
    self.all.detect {|x|x.name == item}
  end
  def find_or_create_by_name(item)
    self.find_by_name(item) || self.create(item)
  end
  
end