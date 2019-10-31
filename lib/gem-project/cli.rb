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
    binding.pry 
    print_teams
    puts ""
    puts ""
    puts "Enter the number of a team you'd like to learn more about:"
    
    input = gets.strip.downcase
    while input != "exit" do
      team = Team.all[input.to_i - 1]
      Scraper.scrape_team_details(team) 
      print_team(team)
      puts ""
      puts "Do you want to learn about another team?"
      puts "If you do, enter the number of a team to see more info or type 'exit' to get out of the gem."
      input = gets.strip.downcase
    end
    puts "Thanks for stopping by! See ya later!"
  end
    
    def print_team(team)
      binding.pry 
      puts "#{team.name}"
      puts "Team location: #{team.location}"
      puts "Stadium name: #{team.stadium}"
      puts "The #{team.stadium} seats #{team.capacity} rabid fans."
      
    end
    
    def print_teams
      Team.all.each.with_index(1) do |team, index|
        puts "#{index}. #{team.name}"
      end
    end
    
    
    
    
  end
  