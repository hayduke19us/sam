require 'net/https'
require 'uri'
require 'json'
require 'symboltable'

module Wiki

  extend ActiveSupport::Concern
  
  class Wiki

    attr_reader :uri

    def initialize city
      @city = city.gsub(" ", "%20")
      @endpoint = "http://en.wikipedia.org/w/api.php?"
      @main = "format=json&action=query&titles=#{@city}&"
      @properties = "prop=extracts&exsentences=10&"
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
      search[key].extract
    end
  end
end
