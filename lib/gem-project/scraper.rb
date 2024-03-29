class Scraper
  
  def self.scrape_teams
    html = open("https://en.wikipedia.org/wiki/2019%E2%80%9320_Premier_League#Stadiums_and_locations")
    doc = Nokogiri::HTML(html)
    
    doc.css("tbody")[1].css("tr").drop(1).each do |fc_fact|
     
      team = Team.new
      team.name = fc_fact.css("a")[0].text.strip
      team.location = fc_fact.css("td")[1].text.strip
      team.stadium = fc_fact.css("td")[2].text.strip
      team.capacity = fc_fact.css("td")[3].text.strip
      team.url = fc_fact.css("a")[0].attribute("href").value
    end
    
  end
 
  def self.scrape_team_details(team)
    html = open("https://en.wikipedia.org#{team.url}")
    doc = Nokogiri::HTML(html)
     
    team.nickname = doc.css("table.infobox").css("td")[2].children.map{|n| n.text unless n.text == "[1]" || n.text.strip == ","}.compact.join(", ")
    
  end
  
end