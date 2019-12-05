class CLI # CLI, responsible for user interactions, interfecing with command line 
  def run
   puts "Welcome to NYC Parks!"
   Scraper.scrape_parks
   display_parks_names
 end

 def display_parks_names
  puts "Those are NYC Parks names:"
  Park.all.each.with_index (1) do |park, idx|
  puts "#{idx}. #{park.name}"
   end
  end
 def user_select_park
  puts "Please select park you would like"
  i = gets
  if i < 10 && i > 0

    #valid choice find that number park
  else
    #invalid input ask for the input again
    puts "Invalid input, please try again"
  end
  

  end
end


  