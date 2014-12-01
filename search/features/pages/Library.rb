class Library
	def addTitle(newTitle)
		@titles ||= []
		@titles << newTitle
	end
	
	def search(searchWord)
		matchedTitles = []
		@titles.each do |title|
			if title.upcase().index(searchWord.upcase()) != nil
				matchedTitles << title
			end
		end
		return matchedTitles
	end
end