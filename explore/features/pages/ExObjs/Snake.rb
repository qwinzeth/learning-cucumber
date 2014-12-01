class Snake < ExObj
	@@STATE_WAITING = 0
	@@STATE_HISSING = 1
	@@STATE_BITING = 2
	@@STATE_BITTEN = 3
	def initialize()
		super("snake")
		@state = @@STATE_WAITING
	end
	
	def getDescription()
		return "A poisonous snake."
	end
	
	def timerTick()
		@state++
	end
	
	def isBiting?()
		return @state == @@STATE_BITING
	end
end