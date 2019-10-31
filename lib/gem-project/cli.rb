class CLI
  def run
    puts ""
    puts ""
    puts ":================================================:"
    puts ":                                                :"
    puts ":  Welcome the English Premier League Info Gem!  :"
    puts ":       Your one stop for all things EPL         :"
    puts ":                                                :"
    puts ":================================================:"
    puts ""
    puts ""
    
    Scraper.scrape_teams
    
    print_teams
    puts ""
    puts ""
    puts "Enter the number of a team you'd like to learn more about:"
    
    input = gets.strip.downcase
    while input != "exit" do
      team = Team.all[input.to_i - 1]
      Scraper.scrap_team_details(team) if !team.stadium
      print_team(team)
      puts ""
      puts "Do you want to learn about another team?"
      puts "If you do, enter the number of a team to see more info or type 'exit' to get out of the gem."
      input = gets.strip.downcase
    end
    puts "Thanks for stopping by! See ya later!"
  end
    
    def print_team(team)
      puts "#{team.name}"
      puts "Stadium name: #{team.stadium}"
    end
    
    def print_teams
      Team.all.each.with_index(1a)
    end
    
    
  end
  