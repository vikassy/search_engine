require 'mechanize'
require_relative '../helpers/word_helper'

class Crawler
  #write code to make basic crawling and indexing
  def crawl_page (link)
    agent = Mechanize.new
    agent.user_agent_alias = 'Mac Safari'
    agent.max_history = 10 # unlimited history
    page = agent.get(link)
    stack = page.links
    visited =[]


    while l = stack.pop
    		next unless l.uri
    		host = l.uri.host
    		next unless host.nil? or host == agent.history.first.uri.host
    		next if agent.visited? l.href
           if (!visited.include?(l.href))
    		puts "crawling #{l.uri}"
    		begin
          visited << l.href
          page = l.click
          body = ""
          body.force_encoding('utf-8')
          body = page.body.to_s.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
          words = [].pack('C*').force_encoding('utf-8')
          words = filter body.strip
          puts words
            rescue Encoding::CompatibilityError => e
              puts e
    			next unless Mechanize::Page === page
    			stack.push(*page.links)
    		rescue Mechanize::ResponseCodeError => e
          puts e
      	end
      end

	  end
	end

  def url_manipulate(base_url,extracted_url)
    imp = base_url.split('.')[1,2]
    array = extracted_url.split('.')[0,3]
    if perform_check(array,imp)
      url = extracted_url
    else
      url = base_url+extracted_url
    end
    url = check_http(url)
  end

  def check_http(url)
    if (url[0,4] != "http")
      url = "http://"+url
    else
      url
    end
  end

  def perform_check(array,imp)
    if not array.include?(imp[0])
      return false
    end
    array.each do |word|
      if word[0,imp[1].length] == imp
        return true
        Encoding
      end
    end

  end
end

