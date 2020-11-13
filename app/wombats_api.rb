require 'httparty'

class WombatsAPI

    # Create a search url
    def self.createSearch
        baseURL = "https://www.googleapis.com/customsearch/v1?"
        key = "key=" + ENV['GOOGLE_API_KEY'] + "&"
        customSearch = "cx=" + ENV['GOOGLE_CUSTOM_SEARCH'] + "&"
        query = "q=" + "wombat" + "&"

        # Google's API returns 100 results in pages of 10. Randomise which page of results is accessed.
        startSearchAt = "start=" + (rand(9) * 10).to_s + "&"

        baseURL + key + customSearch + query + startSearchAt
    end

    # Collect all available image urls from JSON data into an array
    def self.searchWombats
        searchURL = WombatsAPI.createSearch
        wombatSearch = HTTParty.get(searchURL)
        searchResults = wombatSearch.parsed_response
        
        images = []
        searchResults['items'].each do |item|
            if item['pagemap'] && item['pagemap']['cse_image']
                image_link = item['pagemap']['cse_image'][0]['src']
            end
            images << image_link
        end

        images
    end

end