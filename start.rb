#require 'mechanize'
#require 'sanitize'
#require 'active_record'
require_relative './crawler/crawler.rb'
require_relative './crawler/models.rb'
require_relative './migratedb.rb'
require 'pathname'
require 'sinatra'

get '/' do

end

def app
  Sinatra::Application
end

class Server
  @crawl

  def initialize table

  end

  def check_table table
    x = MigrateDB.new()
    x.migrate()
    return x.check_exists('words')
  end

  def start_crawling
    @crawl = Crawler.new("http://google.com")
    @crawl.start_crawl
  end

  def crawling_status
    return @crawl.getcrawlstat
  end
end

