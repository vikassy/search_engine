require 'active_record'
require_relative  "../dbconnect.rb"
#Include all database tables classes

class Word < ActiveRecord::Base

  before_save :all_links_must_be_unique_for_a_word

  attr_accessor :word, :links
  serialize :links

  validates :word , uniqueness: true

  def all_links_must_be_unique_for_a_word
    self.links = self.links.uniq
  end


end
