require 'rspec/given'
require_relative "../../crawler/crawler.rb"

RSpec::Given.use_natural_assertions

describe Crawler do 

  Given(:url_manipulater) {Crawler.new}

  def manipulate(base_url,extracted_url)
    url_manipulater.url_manipulate(base_url,extracted_url)
  end


  Then {manipulate('http://www.google.com','/hello/world') == "http://www.google.com/hello/world"}
  Then {manipulate('http://www.google.com','www.google.com/init/about.html') == "http://www.google.com/init/about.html"}
  Then {manipulate('http://www.google.com','support.google.com') == "http://support.google.com"}
  Then {manipulate('http://www.google.com','support.google.com/something') == "http://support.google.com/something"}

end