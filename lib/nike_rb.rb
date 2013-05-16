require 'nike_rb/version'
require 'httparty'
require 'json'

module NikeRb

		USER_AGENT = "NikeRb Ruby Wrapper #{NikeRb::VERSION}"
	  API_URI = 'https://api.nike.com'
	  APP_ID_HEADER = 'fuelband'
		ACCEPT_HEADER = 'application/json'

		HEADERS = {
			'appid' => APP_ID_HEADER,
			'Accept' => ACCEPT_HEADER
		}

	class Client

		def initialize(access_token)
			@access_token = access_token
		end

		

	end

	class Api

		def initialize(access_token)
			@access_token = access_token
		end

		def activities(options={})
	  	params = "#{API_URI}/me/sport/activities?access_token=#{@access_token}"
	  	if options[:count]
	  		params << "&count=#{options[:count]}"
	  	end

			response = HTTParty.get(params, headers: HEADERS)
			body = JSON.parse response.body

			return body
		end

		def activity_detail(id)
			params = "#{API_URI}/me/sport/activities/#{id}?access_token=#{@access_token}"

			response = HTTParty.get(params)
			body = JSON.parse response.body

			return body
		end

	end

end
