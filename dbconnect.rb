# default boilerplate
require 'rubygems'
require 'active_record'

#change for your actual setup
ActiveRecord::Base.establish_connection(:adapter=>'pg', :database=>'HEROKU_POSTGRESQL_AQUA')

#personal preference
ActiveRecord::Base.pluralize_table_names = false
