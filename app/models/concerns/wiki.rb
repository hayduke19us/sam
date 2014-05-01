require 'net/https'
require 'uri'
require 'json'
require 'symboltable'

module Wiki

  extend ActiveSupport::Concern
  
  class Willy

    attr_reader :uri, :city

    def initialize city, sentences=3
      @sentences = sentences
      @city = city.gsub(" ", "%20")
      @endpoint = "http://en.wikipedia.org/w/api.php?"
      @main = "format=json&action=query&titles=#{@city}&"
      @properties = "prop=extracts&exsentences=#{@sentences}&"
      @output = "exsectionformat=plain&explaintext=true&redirects=true"
      @uri = URI("#{@endpoint}#{@main}#{@properties}#{@output}")
    end

    def search
      parsed = parse(response)
      sym = symtable(parsed)
      sym.query.pages
    end

    def response
     Net::HTTP.get(self.uri)
    end

    def parse response
     JSON.parse(response)
    end

    def symtable hash
      SymbolTable.new hash
    end

    def key 
      search.keys.first
    end

    def summary 
      city_info = "#{self.city}_info"
      unless $redis[city_info]
        info = search[key].extract
        $redis.set(city_info, info)
        info
      else
        $redis[city_info]
      end
    end
  end
end
