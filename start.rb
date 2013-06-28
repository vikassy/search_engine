#require 'mechanize'
#require 'sanitize'
require 'active_record'
require_relative './crawler/crawler.rb'
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
  @crawl
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
    @crawl = Crawler.new("http://google.com")
    @crawl.start_crawl
  end

  def crawling_status
    return @crawl.getcrawlstat
  end
end

