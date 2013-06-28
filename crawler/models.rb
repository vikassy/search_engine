#require ''
#Include all database tables classes

class Word < ActiveRecord::Base
  establish_connection adapter: 'sqlite3', database: 'test.db'
  connection.create_table table_name, force: true do |t|
    t.string :word
    t.text :links
  serialize :links
  end
end