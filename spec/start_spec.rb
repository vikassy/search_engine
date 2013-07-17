require_relative '../start.rb'


#Please do gem install rack && gem install rack-test before running the test

require 'rack/test'
require 'capybara/rspec'

set :environment , :test

Capybara.app = Sinatra::Application

Rspec.configure do|config|
  config.include Capybara::DSL
end

describe "class Server" do
  include Rack::Test::Methods
 

  it "should check if database exists" do
    server = Server.new('test.db')
    server.check_table("words").should be_true
  end
  
  it "should start crawling" do
    server = Server.new('test.db')
    server.start_crawling('https://www.coursera.org/')
    server.crawling_status.should be_true
  end


 

  it "should start sinatra serve" do
    server = Server.new('test.db')
    get '/'
    last_response.should be_ok
  end

  it "should check for the form" do
    visit '/'
    page.has_selector?('input[name=\'q\']').should be_true
  end

  describe "result of post request" do
    let (:server) {Server.new('test.db')}
    before {visit '/'}

    it "should respond with 200: positive test" do
      fill_in 'q', :with=>"testing"
      page.click_button 'search'
      page.status_code.should == 200
    end

    it "should respond with 403 or 404: negative test" do
      click_button 'search'
      page.status_code.should == 404 or page.status_code.should == 403
    end
  end
end
