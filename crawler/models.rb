require 'active_record'
require_relative  "../dbconnect.rb"
#Include all database tables classes

class Words < ActiveRecord::Base

  attr_accessible :words, :links	
  serialize :links
  
end