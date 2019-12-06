class CLI # CLI, responsible for user interactions, interfecing with command line 
  def run
    puts "Welcome to NYC Parks!"
    Scraper.scrape_parks
    Park.all[0].scrape_details
    display_park_name
    #tell the user to choose the park
    puts "Choose a number between 1-#{Park.all.size} to select a Park and get more information"
    #accept thir input
    input = gets.chomp.to_i
    #check if input is valid
    until valid_input?(input)
      puts "Not a valid choice - choose 1-5"
      input = gets.chomp.to_i
    end

    puts "Name of the Park:"
     display_park_name(input)
    end


  def valid_input?(input)
    #checking if thier input is between 1-10 (valid)
    input.between?(1, Park.all.size)
    #input is <=10 && input > 0
  end

  def display_park_name
    puts "Those are NYC Parks names:"
    Park.all.each.with_index (1) do |park, idx|
    puts "#{idx}. #{park.name}"
    end
  end

  def display_park_location
    puts "Those are NYC Parks locations:"
    Park.all.each.with_index (1) do |park, idx|
    puts "#{idx}. #{park.name.location}"
    end
  end
end