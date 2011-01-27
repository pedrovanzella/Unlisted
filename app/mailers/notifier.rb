class Notifier < ActionMailer::Base
  default :from => "no-reply@unlisted.me"

	def unlisted(recipient, lists= [])
		@account = recipient
		mail(:to => recipient.email, :subject => "You got unlisted!")
	end
end
