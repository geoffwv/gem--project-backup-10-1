class Scraper
  
  def self.scrape_teams
    html = open("https://www.premierleague.com/clubs")
    doc = Nokogiri::HTML(html)
    
    doc.css("div.nameContainer")[0].each do |team|
      team = Team.new
          binding.pry
      team.name = team.css("h4.clubName").text 
    end
  end
 
 def self.scrape_team_details(team)
   html = open("https://www.premierleague.com/clubs")
   doc = Nokogiri::HTML(html)
   team.stadium = doc.css("div.nameContainer")[0].css("div.stadiumName").text
  end
  
  
end