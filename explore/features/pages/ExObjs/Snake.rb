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
	
	def resetState()
		@state = @@STATE_WAITING
	end
	
	def timerTick()
		if(@state < @@STATE_BITTEN)
			@state = @state + 1
		end
	end
	
	def getStateDescription
		if @state == @@STATE_WAITING
			return "The snake sits coiled."
		elsif @state == @@STATE_HISSING
			return "The snake hisses!"
		elsif @state == @@STATE_BITING
			return "The snake bites!"
		elsif @state == @@STATE_BITTEN
			return "The snake watches you carefully."
		else
			return "The snake does something weird: #{@state}"
		end
	end
	
	def isBiting?()
		return @state == @@STATE_BITING
	end
end