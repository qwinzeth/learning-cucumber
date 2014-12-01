class Person < ExObj
	def initialize(name, conversation)
		@name = name
		@conversation = conversation
	end
	
	def getDescription()
		return "A person named #{@name}."
	end
	
	def talk()
		return @conversation
	end
end