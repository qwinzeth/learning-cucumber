class Torch < ExObj
	def initialize()
		super("torch")
		@lit = false
		@obtainable = true
	end
	
	def light()
		@lit = true
		@lightPower = 5
	end
	
	def douse()
		@lit = false
		@lightPower = 0
	end

	def getDescription()
		if @lit
			return "A lit torch."
		else
			return "An unlit torch."
		end
	end
end