class Team
  
  attr_accessor :name, :team, :stadium, :url, :location, :capacity, :nickname
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all 
  end 
  
end