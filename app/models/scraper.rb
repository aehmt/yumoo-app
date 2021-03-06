require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper

  attr_reader :base_address, :search_fragment, :location_fragment
  attr_accessor :scrape_address, :restaurants

  def initialize
    @base_address = "https://www.yelp.com"
    @search_fragment = "/search?find_desc="
    @location_fragment = "&find_loc="
  end

  #possible search filters here or in a separate function?
  #https://www.yelp.com/search?find_desc=banana+split&find_loc=New+York%2C+NY
  #change location into a zip code here
  def parse_address(food_item, location=10005)
    @scrape_address = "#{@base_address}#{@search_fragment}#{food_item}#{@location_fragment}#{location}".gsub(" ", "+").gsub(",","%2C")
  end

  def parse_1_mile_distance
    distance_element = "&start=0&l="
    raw_text = Nokogiri::HTML(open(@scrape_address, "User-Agent" => "Mozilla/5.0 (X11; CrOS i686 12.433.216) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.105 Safari/534.30"))
    coordinates = raw_text.css(".filter-panel").css(".radio-list").css("li")[6].css("input").attribute("value").value
    @scrape_address = "#{@scrape_address}#{distance_element}#{coordinates}"
  end

  def restaurant_options
    raw_text = Nokogiri::HTML(open(@scrape_address, "User-Agent" => "Mozilla/5.0 (X11; CrOS i686 12.433.216) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.105 Safari/534.30"))
    # binding.pry
      area_of_interest = raw_text.css(".regular-search-result")
      if area_of_interest.empty?
        return [nil, {:error => "You live too far from this food. Move somewhere more civilized!"}]
      else
      i = 0
      collection = []

      while i < 6
        restaurant = Hash.new(0)
        #name
        restaurant[:name] = area_of_interest.css(".indexed-biz-name")[i].css("span").text
        #rating
        restaurant[:rating] = area_of_interest.css(".rating-large")[i].css("i").attribute("title").value
        #number of reviews on yelp
        # restaurant[:reviews] = area_of_interest.css(".review-count.rating-qualifier")[i].text.match(/\d+\sreviews/)[0]
        #price category
        restaurant[:price] = area_of_interest.css(".business-attribute.price-range")[i].text
        # restaurant category
        restaurant[:category] = area_of_interest.css(".category-str-list")[i].text.gsub(/\s{2,}/,"")
        #neighborhood
        # restaurant[:neighborhood] = area_of_interest.css(".neighborhood-str-list")[i].text.gsub(/\s{2,}/,"")
        #address unformatted
        restaurant[:address] = area_of_interest.css("address")[i].text.gsub(/\s{2,}/,"")
        #phone
        restaurant[:phone] = area_of_interest.css(".biz-phone")[i].text.gsub(/\s{2,}/,"")

        #Yelp webpage
        yelp_path = area_of_interest.css(".indexed-biz-name")[i].css("a").attribute("href").value.split("?")[0]
        restaurant[:link] = "#{@base_address}#{yelp_path}"

        #source
        restaurant[:source] = "Yelp"

        collection[i] = restaurant
        i = i + 1
        #company webpage & yelp menupage (both of these require scraping the yelp webpage)!
      end
      @restaurants = collection
      model_generator
    end
    #return data in a hash that can be read to restaurant model or view via controller
  end

  def model_generator
    Restaurant.create_instances(@restaurants)
  end

  def scrape_it(food_item, location=10005, restricted = false)
    parse_address(food_item, location)
    parse_1_mile_distance if restricted
    restaurant_options
  end
end

#Quick calls For testing
# scr = Scraper.new
# scr.parse_address("pizza", 11214)
# scr.parse_1_mile_distance
#
# scr.restaurant_options
# puts scr.restaurants
