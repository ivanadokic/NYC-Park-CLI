class Park
  #responsible for initializing and saving parks

attr_accessor :name, :location, :url, :facilities
        @@all = []
        def initialize 
          @url = "https://www.nycgovparks.org"
          @facilities = []
          self.save
        end
      
        def self.all
           @@all
        end
      
        def save
          @@all << self
        end

        def scrape_details
          doc = Nokogiri::HTML(open(@url))
        end


end