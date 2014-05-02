require "net/http"
require "uri"
require "json"
require "symboltable"

module Weather

  extend ActiveSupport::Concern

  class Forcast

  attr_reader :sym, :weather

    def initialize city
      @city = city.gsub(" ", "%20")
      @uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{@city}")
      @response = Net::HTTP.get(@uri)
      @sym = SymbolTable.new(JSON.parse(@response))
      @weather = SymbolTable.new(@sym.weather.first)
    end

    def temp
      (self.sym.main.temp - 273.15).round
    end

    def overview
      self.weather.description
    end

  end

end
