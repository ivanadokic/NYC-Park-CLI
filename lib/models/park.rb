class Park
  #responsible for initializing and saving parks

attr_accessor :name, :location, :more_details, :more_details_url
        @@all = []
        def initialize(name, location, more_details, more_details_url)
          @name = name
          @location = location
          @more_details = more_details
          @more_details_url = more_details_url 
          self.save
        end
      
        def self.all
           @@all
        end
      
        def save
          @@all << self
        end
end