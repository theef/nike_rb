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

		def sport_data
			params = "#{API_URI}/me/sport?access_token=#{@access_token}"

			response = HTTParty.get(params, headers: HEADERS)
			JSON.parse response.body
		end

		def activities(options={})
			if options[:start_date]
				raw_start_date = options[:start_date]
				start_date = raw_start_date.to_date.strftime("%Y-%e-%m")
			end

			if options[:end_date]
				raw_end_date = options[:end_date]
				end_date = raw_end_date.to_date.strftime("%Y-%e-%m")
			end

	  	params = "#{API_URI}/me/sport/activities?access_token=#{@access_token}"
	  	params << "&count=#{options[:count]}" if options[:count]
	  	params << "&offset=#{options[:offset]}" if options[:offset]
	  	params << "&startDate=#{start_date}" if start_date
	  	params << "&endDate=#{end_date}" if end_date

			response = HTTParty.get(params, headers: HEADERS)
			JSON.parse response.body
		end

		def activity_detail(id)
			params = "#{API_URI}/me/sport/activities/#{id}?access_token=#{@access_token}"

			response = HTTParty.get(params, headers: HEADERS)
			JSON.parse response.body
		end

	end

end
