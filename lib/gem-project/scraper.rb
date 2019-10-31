class Scraper
  
  def self.scrape_teams
    html = open("https://en.wikipedia.org/wiki/2019%E2%80%9320_Premier_League#Stadiums_and_locations")
    doc = Nokogiri::HTML(html)
    binding.pry
    
    doc.css("table.wikitable.sortable.jquery-tablesorter")[0].css("tbody")[0].css("tr")[0].css("td")[0].each do |team|
      binding.pry
      team = Team.new
      team.name = team.css("a, title")[0].text
    end
  end
 
def self.scrape_team_details(team)
  html = open("https://en.wikipedia.org/wiki/2019%E2%80%9320_Premier_League#Stadiums_and_locations")
  doc = Nokogiri::HTML(html)
  team.stadium = doc.css("")[0].css("tbody")[0].css("tr")[0].css("td")[2].css("a, title").text
  end
  
  
end