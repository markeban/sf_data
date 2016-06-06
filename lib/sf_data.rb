require "sf_data/version"
require "unirest"

module SfData
  class FilmLocation
    attr_reader :location, :title, :actor_1, :actor_2

    def initialize(hash)
      @location = hash["locations"]
      @title = hash["title"]
      @actor_1 = hash["actor_1"]
      @actor_2 = hash["actor_2"]
    end
    
    def self.all
      @locations = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body
      create_locations(employees_array)
    end

    # def self.search(search_term)
    #   employees_array = Unirest.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json?$q=#{search_term}").body
    #   create_employees(employees_array)
    # end

    private

    def create_locations(array_of_hashes)
      locations = []
      locations_array.each do |location_hash|
        locations << Location.new(location_hash)
      end
      return locations
    end
  end
end
