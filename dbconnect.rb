# default boilerplate
require 'rubygems'
require 'active_record'

#change for your actual setup
#ActiveRecord::Base.establish_connection(:adapter=>'postgresql', :database=>'HEROKU_POSTGRESQL_AQUA') #FOR PRODUCTION
ActiveRecord::Base.establish_connection(:adapter=>'sqlite3', :database=>'../migrations/test.db') #FOR DEVELOPMENT

#personal preference
ActiveRecord::Base.pluralize_table_names = true
