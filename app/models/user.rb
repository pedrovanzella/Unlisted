class User < ActiveRecord::Base
	has_and_belongs_to_many :lists

	after_create :create_lists

	def self.create_with_omniauth(auth)	 
		create! do |user|	 
			user.provider = auth["provider"]	
			user.uid = auth["uid"]	
			user.username = auth["user_info"]["nickname"]
			user.name = auth["user_info"]["name"] 
			user.token = auth["credentials"]['token']
			user.secret = auth["credentials"]["secret"] 
		end	 
 end

	def create_lists
		Twitter.configure do |config|
		  config.consumer_key = '4PH57DoSzgyt5CfYRfJDhw'
		  config.consumer_secret = '8BSDfkxt46sL1kbW98V2h2arzbzzNkGfpLoVGehnQA'
		  config.oauth_token = self.token
		  config.oauth_token_secret = self.secret
		end
		
		@client = Twitter::Client.new
		cursor = -1
		
		while cursor != 0
			@client.memberships('elland', :cursor => cursor).lists.each do |list|
				@list = List.new
				@list.list_id = list.id
				@list.name = list.full_name
				@list.creator = list.user.name
				@list.last_checked = Time.now.to_datetime
				@list.users << self
				@list.save
				self.save
			end
			cursor = @client.memberships('elland', :cursor => cursor)[:next_cursor]
		end
	end

end
