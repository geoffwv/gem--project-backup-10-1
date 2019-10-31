class Scraper
  
  def self.scrape_teams
    html = open("https://en.wikipedia.org/wiki/2019%E2%80%9320_Premier_League#Stadiums_and_locations")
    doc = Nokogiri::HTML(html)
    
    doc.css("tbody")[1].css("tr").drop(1).each do |fc_name|
     #binding.pry
      team = Team.new
      team.name = fc_name.css("a")[0].text
      team.url = fc_name.css("a")[0].attribute("href")
    end
    #binding.pry
  end
 
  def self.scrape_team_details(team)
    html = open("https://en.wikipedia.org/wiki/2019%E2%80%9320_Premier_League#Stadiums_and_locations")
    doc = Nokogiri::HTML(html)
    team.stadium = doc.css("table.wikitable.sortable.jquery-tablesorter")[0].css("tbody")[0].css("tr")[0].css("td")[2].css("a, title").text
  end
  
  
end