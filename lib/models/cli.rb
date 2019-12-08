  
require 'colorize'

class CLI # CLI, responsible for user interactions, interfecing with command line 
  def run
    puts "WELCOME to NYC Parks!"
    Scraper.scrape_parks
    Park.all[0].scrape_details
    display_park_names
    ask_for_park_choice
    goodbye

  end  
    
  def ask_for_park_choice #tell the user to choose the park
    puts "Choose a number between 1-#{Park.all.size} to select a Park and get more information".colorize(:blue)
    #accept thir input
    input = gets.chomp.to_i
    #check if input is valid
    until valid_input?(input)
      puts "Not a valid choice - choose 1-10".colorize(:red)
      input = gets.chomp.to_i
    end
    puts "Location of the Park and more details:".colorize(:yellow)
  

    display_park_details(input)
  end

  def valid_input?(input)
    #checking if thier input is between 1-10 (valid)
    input.between?(1, Park.all.size)
    #input is <=10 && input > 0
  end

  def display_park_details(input)
    #STEPS
    index=input-1
    park = Park.all[index] 
    Scraper.scrape_facilities(park)
    #1.Accept the argument of the users input, which we expect to be what data type? 
    #It's a string at first because anything a user types in using their keyboard is a string. But we want it to be an integer.
    #2. Take the user's input and turn it into an integer 
    #What does does the integer represent? The place the of the park in 
    
    puts park.location.colorize(:green)
    puts "Park facilities \u{1F3C0} \u{26BD} \u{1F3BE} \u{1F415} \u{26BE} \u{26F9} :"
    puts park.facilities
  end

  def display_park_names

    puts "Those are NYC Parks names:".colorize(:green)
    Park.all.each.with_index (1) do |park, idx|
      puts "#{idx}. #{park.name}".colorize(:red)
    end
  end

  # def display_park_location
  #   puts "Those are NYC Parks locations:"
  #   Park.all.each.with_index (1) do |park, idx|
  #     puts "#{idx}. #{park.location}"
  #   end
  # end
  def goodbye
    puts "THANK you for using the NYC Park CLI!

                      `.--::::/:::--.`
                `.:/++++//:::::://++++/-.
            `-/+++:-.`            `.-:+++:.
          `:++/:.          `           .:++/-`
        `:++/.            -+`             -/++-
        ./+/-             .++/`              -++/`
      -++/`            -/+++++//             `/++.
      -++:            `-+++++++++:-             /++.
    `++/             `+++++++++++:             `/++`
    /++`   `:-...``` .+++++++++++- ....:/:::    .++:
    `++:     -+++++++++++++++++++++/+++++++/      /++`
    .++-      /++++++++++++++++++++++++++++/      :++`
    .++.     `++++++++++++++++++++++++++++/.      -++.
    .++-      `/++++++++++++++++++++++++++-       :++`
    `++/   `.-/++++++++++++++++++++++++++++/:-`   /+/
    :++. .:++++++++++++++++++++++++++++++++/-.` -++-
      /+/`  `-:/+++++++++:-:++//+++++++++/-.    .++/
      `/+/`     /++++/:-`   /-   .-:/++++-     .++/`
      `/++.    .-.`        -.        `...    -++/`
        :++/`              -:              ./++-
          ./++:.            -.            ./++:`
            .:++/:.                   `.:+++:`
              `-:+++/:-.``      ``.-:/+++:.
                  .-:/++++++++++++++/:-`
                      ``...--...``



    ".colorize(:green)
    input = gets.chomp
     until input == "exit"
      puts "If you want to seacrch for a new Park choose 1-10, if not please type exit".colorize(:blue)
      input = gets.chomp.to_i
      if valid_input?(input)
        break
      
          else
       input = "exit"
      end
    end 
   
    if input.class == Integer
      display_park_names
      ask_for_park_choice
    end
  end
end