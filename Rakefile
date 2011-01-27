# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
 User.check_lists
end

Unlisted::Application.load_tasks
