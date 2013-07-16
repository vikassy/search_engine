require 'active_record'
require_relative  "../../dbconnect.rb"
require_relative "../../model/word.rb"
require 'factory_girl'
#Include all database tables classes


describe "class Word" do

  before(:each) do
    FactoryGirl.define do
        factory :word do
          word "something"
        end
    end
    @example_word = Word.new
    @example_word.word = "Something"
  end

  it "should not have same links" do
    w = FactoryGirl.build(:word , links: ["www.something.com","www.something.com"])
    w.links == ["www.something.com"]
  end


end


