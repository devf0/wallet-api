require 'uri'
require 'net/http'
require 'openssl'
require 'json'

module LatestStockPrice
  class << self
    BASE_URL = "https://latest-stock-price.p.rapidapi.com"

    def price(symbol)
      query_params = URI.encode_www_form('Indices' => symbol)
      uri = URI("#{BASE_URL}/price?#{query_params}")
      make_request(uri)
    end

    def price_all
      uri = URI("#{BASE_URL}/any")
      make_request(uri)
    end

    private

    def make_request(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri)
      request['X-RapidAPI-Key'] = Rails.application.credentials.x_rapidapi_key
      request['X-RapidAPI-Host'] = Rails.application.credentials.x_rapidapi_host
      
      response = http.request(request)
      JSON.parse(response.read_body)
    end
  end
end
