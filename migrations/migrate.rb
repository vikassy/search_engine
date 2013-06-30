# simple script to migrate the database
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter=>'sqlite3',:database=>'test.db')
#migrations should be placed in the "migrations" subdirectory
#the script's argv[0] should be the desired version to migrate to
#if there is no argument, this will migrate to the highest version
ActiveRecord::Migrator.migrate "./db/", ARGV[0] ? ARGV[0].to_i : nil