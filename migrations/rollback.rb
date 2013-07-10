#rollback.rb
require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.sqlite3')
ActiveRecord::Migrator.rollback "./db/", ARGV[0] ? ARGV[0].to_i : nil