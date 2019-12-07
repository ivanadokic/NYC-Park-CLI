require 'open-uri'
require 'nokogiri'

class Scraper #responsible for scraping
    def self.scrape_parks
        site = "https://www.nycgovparks.org/parks?search=11101&type=zip#form_top"  
        html = open(site)
        doc = Nokogiri::HTML(html)
        array_of_parks = doc.css('div.park-search-item')
        array_of_parks.each do |park|
            p = Park.new
            p.name = park.css('h3').text      #css selector for the park name is h3
            p.location = park.css('p.park-search-location').text  #css selector for the park address is park p.park-search-location
            p.url << park.css('p.more-left >a')[0].attributes["href"].value 
         end 
    end


    def self.scrape_facilities(park_obj)
        html = open(park_obj.url)
        doc = Nokogiri::HTML(html)
        array_of_facilities= doc.css("span.park_facilities_list_text")
        array_of_facilities.each do |facility|
        park_obj.facilities << facility.text
         end
    end    
end
