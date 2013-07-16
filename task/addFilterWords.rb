require_relative '../model/filterWord'

words = ["THE",",","A","AN","AS","AND","IN","TO","OF","IT","ALL","BE","HAS","HAVE","HAD","WHO","HOW","WHEN","WHERE","WHY","ARE","IS","FOR",".","MY","ON"]

Filter.delete_all
puts "DB CLEARED"

words.each do |word|
  Filter.create(word: "#{word}")
  puts "added #{word} to filter"
end
