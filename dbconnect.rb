# default boilerplate
require 'rubygems'
require 'active_record'

#change for your actual setup
ActiveRecord::Base.establish_connection(:adapter=>'sqlite3', :database=>'test.db')

#personal preference
ActiveRecord::Base.pluralize_table_names = false