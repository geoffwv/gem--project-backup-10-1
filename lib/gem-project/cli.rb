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
    #binding.pry 
    print_teams
    puts ""
    puts ""
    puts "Enter the number of a team you'd like to learn more about:"
    
    input = gets.strip.downcase
    while input != "exit" do
      team = Team.all[input.to_i - 1]
      Scraper.scrape_team_details(team) if !team.nickname
      #if input.to_i > 0 && input.to_i <= 20  VALIDATION LINE. WHERE THE HELL DOES IT GO?
      print_team(team)
      puts ""
      puts "Do you want to learn about another team?"
      puts "If you do, enter the number of a team to see more info, type 'list' to see the "
      puts "list of teams again or type 'exit' to get out of the gem."
      input = gets.strip.downcase
      # if input = "list"
      #   print_team(team)
      # else THE 'LIST' OPTION. HOW TO MAKE IT WORK...
    end
    puts "Thanks for stopping by! See ya later!"
  end
    
    def print_team(team)
      #binding.pry 
      puts ":==========================:"
      puts "Name: #{team.name}"
      puts "Team location: #{team.location}"
      puts "Stadium name: #{team.stadium}"
      puts "#{team.stadium} seats #{team.capacity} rabid fans."
      puts "Nickname(s) for #{team.name}: #{team.nickname}"
      puts ":==========================:"
      
    end
    
    def print_teams
      Team.all.each.with_index(1) do |team, index|
        puts "#{index}. #{team.name}"
      end
    end
    
    
    
    
  end
  