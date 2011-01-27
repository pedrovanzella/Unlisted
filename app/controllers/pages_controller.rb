class PagesController < ApplicationController
	def home
		if current_user
			@list_count = current_user.lists.count
		else
			@list_count = nil
		end
	end
	
	def about
	end
	
	def contact
	end
end
