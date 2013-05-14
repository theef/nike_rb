require 'nike_rb/version'
require 'httparty'

module NikeRb

	def initialize(access_token)
		@access_token = access_token
	end

  USER_AGENT = "NikeRb Ruby Wrapper #{NikeRb::VERSION}"
  API_URI = 'https://api.nike.com'
  APP_ID_HEADER = 'fuelband'
	ACCEPT_HEADER = 'application/json'

	HEADERS = {
		'appid' => APP_ID_HEADER,
		'Accept' => ACCEPT_HEADER
	}

  def self.current_fuel(options={})
  	params = "/me/sport/activities?access_token=#{@access_token}"
  	if options[:count]
  		params << "&count=#{options[:count]}"
  	end

		response = HTTParty.get("#{params}", headers: { HEADERS })
		body = JSON.parse response.body
	end
end
