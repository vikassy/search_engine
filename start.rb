require 'mechanize'
require_relative './crawler/crawler.rb'
require_relative './model/word.rb'
require 'sinatra'

set :server, 'webrick'

get '/' do
 erb :form
end

post '/form' do
  @words = params[:words]
  @link = params[:link_name]

  auth = Authentication.where(:authentication_token=>params[:auth_token])

  if auth.nil?
    status 403
  else
    status 200
  end

  erb :display
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
