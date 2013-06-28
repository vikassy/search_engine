require 'active_record'
require 'sinatra'

class Word < ActiveRecord::Base
  establish_connection adapter: 'sqlite3', database: 'test.db'
  connection.create_table table_name, force: true do |t|
    t.string :word
    t.text :links
  serialize :links
  end
end

class Server
  def initialize table

  end

  def check_table table
    if (defined?table)
      return true
    else
      return false
    end
  end

  def start_crawling

  end

  def crawling_status

  end
end

