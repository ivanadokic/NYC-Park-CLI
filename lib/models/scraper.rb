require 'open-uri'
require 'nokogiri'

class Scraper #responsible for scraping
    def self.scrape_parks
        site = "https://www.nycgovparks.org/parks?search=11101&type=zip#form_top"  
        html = open(site)
        doc = Nokogiri::HTML(html)
        array_of_parks = doc.css('div.park-search-item')
        array_of_parks.each do |park|
            name = park.css('h3').text
            location = park.css('p.park-search-location').text
            more_details = park.css('p.more-left >a')[0].children[0].text
            more_details_url = park.css('p.more-left >a')[0].attributes["href"].value
            new_url = "https://www.nycgovparks.org" << more_details_url
            Park.new(name, location, more_details, new_url)
            #css selector for the park name is h3
            #css selector for the park address is park p.park-search-location
        end
    end
end
