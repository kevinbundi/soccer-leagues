require 'json'
require 'net/http'
require 'open-uri'

class LeaguesController < ApplicationController
	def index
  		pokemon_uri = "http://api.football-data.org/v1/competitions/" 
  		uri = URI.parse(pokemon_uri)
		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Get.new(uri.request_uri)
		request.initialize_http_header({"X-Auth-Token" => "fdc840e2adde4860b7e77f8f27ba004e"})

		response = http.request(request)   
		data = response.body
		@pokemon = JSON.load(data) 
  	end 
  	def show
  		pokemon_uri = "http://api.football-data.org/v1/competitions/" + params[:id] + "/teams"
  		uri = URI.parse(pokemon_uri)
		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Get.new(uri.request_uri)
		request.initialize_http_header({"X-Auth-Token" => "fdc840e2adde4860b7e77f8f27ba004e"})

		response = http.request(request)   
		data = response.body
		@pokemon = JSON.load(data) 
  	end
end
