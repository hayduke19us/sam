require 'net/https'
require 'uri'
require 'json'

module Photo

  extend ActiveSupport::Concern

  class Flickr 
    API = "59a3d0192d16da2a2d739d0c9d25fdf4"

    attr_reader :base_uri, :http

    def initialize  
      @base_uri = "https://api.flickr.com/services/rest"
    end

    def https_setup http
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def search_url city, amount=10, format="json"
      "/?method=flickr.photos.search&api_key=#{API}&tags=#{city}&safe_search=1&per_page=#{amount}&page=1&format=#{format}&nojsoncallback=1"
    end

    def uri_parse url
      URI.parse(url)
    end

    def search city, amount=20, format="json"
      uri = uri_parse("#{self.base_uri}#{search_url(city, amount, format)}") 
      http = Net::HTTP.new(uri.host, uri.port)  
      https_setup(http)
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response = JSON.parse(response.body)
      photos = response["photos"]
      photos['photo']
    end

  end

  class Search

    attr_reader :cities_array, :flickr

    def initialize cities
      @cities_array = cities 
      @flickr = Flickr.new
    end

    def flickr_repo 
      Hash[self.cities_array.map {|city| [city, flickr.search(city.delete(" "))]}]
    end

    def get_urls array
      array.map do |p|
       "http://farm#{p['farm']}.staticflickr.com/#{p['server']}/#{p['id']}_#{p['secret']}.jpg" 
      end
    end

    def image_urls
      hash = {}
      self.flickr_repo.each do |city, value|
        hash[city] = get_urls(value)
      end
      hash
    end


  end

end
