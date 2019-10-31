class Team
  
  attr_accessor :name, :team, :stadium, :url, :location, :capacity, :blurb
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all 
  end 
  
end