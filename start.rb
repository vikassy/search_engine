require '../crawler/crawler.rb'
require 'mechanize'

class Server
  #your code here
  #
  @@a=0
  def initialize table
    #code
    @@a=0
  end

  def check_table table
    #code
  end

  def start_crawling link
    agent = Mechanize.new
    page = agent.get(link)
    crawl_bot= Crawler.new
    crawl_bot.crawl_page(link)
    @@a=1
  end

  def crawling_status
    return true if @@a==1
  end
end