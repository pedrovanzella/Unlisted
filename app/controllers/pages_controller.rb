class PagesController < ApplicationController
	def home
		if current_user
			Twitter.configure do |config|
			  config.consumer_key = '4PH57DoSzgyt5CfYRfJDhw'
			  config.consumer_secret = '8BSDfkxt46sL1kbW98V2h2arzbzzNkGfpLoVGehnQA'
			  config.oauth_token = current_user.token
			  config.oauth_token_secret = current_user.secret
			end
		
			@client = Twitter::Client.new
			cursor = -1
			@lists = []
			while cursor != 0
				@client.memberships('elland', :cursor => cursor).lists.each do |list|
					@lists << list
				end
				cursor = @client.memberships('elland', :cursor => cursor)[:next_cursor]
			end
		end
	end
	def about
		
	end
	def contact
		
	end
end
