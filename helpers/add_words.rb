require_relative '../model/word.rb'

def add_words words link
  
  Thread.new{   
       words.each do |w|     
         newword=Word.new
         newword.word=w
         newword.links << link
         newword.save
       end
       }

end
       
