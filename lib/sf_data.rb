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
      locations_array = Unirest.get("https://data.sfgov.org/resource/wwmu-gmzc.json").body
      locations = []
      locations_array.each do |location_hash|
        locations << FilmLocation.new(location_hash)
      end
      return locations
    end
      
  end
end
