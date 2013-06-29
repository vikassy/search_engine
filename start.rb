
require_relative './crawler/crawler.rb'
require_relative './crawler/models.rb'
require_relative './dbconnect.rb'
require 'sinatra'

get '/' do

end

def app
  Sinatra::Application
end

class Server
  attr_accessor :crawl

  def initialize table

  end

  def check_table table
    return ActiveRecord::Base.connection.table_exists?(:words)
  end

  def start_crawling
    @crawl = Crawler.new("http://google.com")
    @crawl.start_crawl
  end

  def crawling_status
    return @crawl.getcrawlstat
  end
end

