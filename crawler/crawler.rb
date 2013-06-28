require 'mechanize'
require 'sanitize'
class Crawler
  
  #write code to make basic crawling and indexing
  @agent
  @firstlink = "http://google.com"
  @status = false

  def initialize link
    @agent = Mechanize.new
    @agent.user_agent_alias = 'Mac Safari'
    @agent.max_history = 10 # unlimited history
    @firstlink = link
    @status = false
  end
  
  def start_crawl
    page = @agent.get(@firstlink)
    stack = page.links
    # crawl_page(Sanitize.clean(page.body),ARGV[0])
    # puts Sanitize.clean(Nokogiri::HTML(page.body)) 
    # puts Word.first.inspect
    @status = true
    Thread.new{
      while l = stack.pop
        next unless l.uri
        host = l.uri.host
        next unless host.nil? or host == @agent.history.first.uri.host
        next if @agent.visited? l.href
   
        #puts "crawling #{l.uri}"
        begin
          page = l.click
          # crawl_page(Sanitize.clean(page.body),l)
          puts Sanitize.clean(page.body)
        rescue Encoding::CompatibilityError
          next unless Mechanize::Page === page
          stack.push(*page.links)
        rescue Mechanize::ResponseCodeError
        end
      end
      @status = false
    }
  end

  def getcrawlstat
    @status
  end
end
