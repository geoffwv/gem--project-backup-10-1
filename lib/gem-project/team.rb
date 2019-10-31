class Team
  
  attr_accessor :name, :url, #the rest need defined
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all 
  end 
  
end