class Scraper
  
  def self.scrape_teams
    html = open("https://www.premierleague.com/clubs")
    doc = Nokogiri::HTML(html)
    binding.pry
    
    doc.css("div.nameContainer")[0].each do |team|
      team = Team.new
      team.name = team.css("h4.clubName").text  
    end
  end
 
  
  
  
end