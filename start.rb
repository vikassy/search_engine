#require 'mechanize'
#require 'sanitize'
#require 'active_record'
require_relative './crawler/crawler.rb'
require_relative './crawler/models.rb'
require 'pathname'
require 'sinatra'

class Server
  @crawl

  def initialize table

  end

  def check_table table
    wordObj = Word.new()
    pn = Pathname.new("./test.db")
    if (pn.exist?)
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

