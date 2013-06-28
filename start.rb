require_relative 'crawler/crawler.rb'
require 'mechanize'
require 'thread'
require 'sinatra'

get '/' do

end

def app
  Sinatra::Application
end

class Server
  #your code here
  #
  attr_accessor :thr

  def initialize table
    #code
  end

  def check_table table

  end

  def start_crawling link
    @thr = Thread.new {
      agent = Mechanize.new
      page = agent.get(link)
      crawl_bot= Crawler.new
      crawl_bot.crawl_page(link)
    }
  end

  def crawling_status
    return true if @thr.status
  end

end
