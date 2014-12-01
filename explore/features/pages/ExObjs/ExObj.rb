class ExObj
	def initialize(name)
		@name = name
		@lightPower = 0
		@obtainable = false
	end
	
	def isObtainable?()
		return @obtainable
	end
	
	def getName()
		return @name
	end
	
	def getLightPower()
		return @lightPower
	end
	
	def getDescription()
		return "An unknown object."
	end
end