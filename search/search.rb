require_relative "../dbconnect.rb"
# require_relative "../"

class Search

	attr_accessor :result_links

	def initialize sentence	
		# words = filter_common_verbs(sentence)
		find_links(words)
		@result_links = []
	end

	def find_links words
		words.each do |f|
			links = Word.find_by_word(f)
			find_result(links)
		end
		@result_links
	end

	def find_result links
		if @result_links = []
			@result_links = links
		else
			@result_links = result_links & links
		end
	end

end