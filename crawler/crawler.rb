require 'mechanize'
require "sanitize"

class Crawler
  #write code to make basic crawling and indexing
  	def crawl_page (link)
		agent = Mechanize.new
		agent.user_agent_alias = 'Mac Safari'
		agent.max_history = 10 # unlimited history
		page = agent.get(link)
		stack = page.links
# crawl_page(Sanitize.clean(page.body),ARGV[0])
# puts Sanitize.clean(Nokogiri::HTML(page.body))
 
# puts Word.first.inspect
 
		while l = stack.pop
  			next unless l.uri
  			host = l.uri.host
  			next unless host.nil? or host == agent.history.first.uri.host
  			next if agent.visited? l.href
	 
  			puts "crawling #{l.uri}"
  			begin
    			page = l.click
    			puts Sanitize.clean(page.body)
        rescue Encoding::CompatibilityError
    			next unless Mechanize::Page === page
    			stack.push(*page.links)
  			rescue Mechanize::ResponseCodeError
  			end
		end
	end
end
