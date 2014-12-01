class Explorer
	def initialize(startingRoom)
		@currentRoom = startingRoom
		@inventory = []
		@poisonLevel = 0
	end
	
	def getCurrentRoomDescription()
		if !canSee?()
			return "It is too dark to see anything."
		end
		return @currentRoom.getDescription()
	end

	def look()
		names = []
		if canSee?()
			@currentRoom.getObjects().each do |obj|
				names << obj.getName()
			end
		end
		return names
	end
	
	def talkTo(personName)
		person = findObject(personName, @currentRoom.getObjects())
		if person == nil || !(person.is_a? Person)
			return "There is no one named #{personName} in this room."
		end
		return person.talk()
	end
	
	def addObject(newObject)
		@inventory << newObject
	end
	
	def addObjectToInventory(objectName)
		newObject = @currentRoom.removeObject(objectName)
		if newObject == nil
			return false
		end
		addObject(newObject)
		return true
	end
	
	def getObjectNames()
		names = []
		@inventory.each do |obj|
			names << obj.getName()
		end
		return names
	end
	
	def lookObject(objectName)
		if !canSee?()
			return "It is too dark to see."
		end
		obj = findObject(objectName, @inventory)
		if obj == nil
			obj = findObject(objectName, @currentRoom.getObjects())
			if obj == nil
				return "There is no #{objectName} nearby."
			end
		end
		return obj.getDescription()
	end
	
	def lightObject(objectName)
		obj = findObject(objectName, @inventory)
		if obj == nil || !(obj.is_a? Torch)
			return false
		end
		obj.light()
		return true
	end
	
	def goExit(exitName)
		newRoom = @currentRoom.getExitRoom(exitName)
		if newRoom == nil
			return false
		end
		resetCurrentRoomStates()
		@currentRoom = newRoom
		return true
	end
	
	def timerTick()
		timerOutput = ""
		if @poisonLevel > 0
			@poisonLevel += 1
			if @poisonLevel > 2
				timerOutput += " You die from poison."
			else
				timerOutput += " Your poison gets worse!"
			end
		end
		@currentRoom.getObjects().each do |obj|
			if obj.is_a?(Snake)
				obj.timerTick()
				if obj.isBiting?()
					@poisonLevel += 1
				end
				timerOutput += " " + obj.getStateDescription()
			end
		end
		return timerOutput
	end
	
private
	def findObject(objectName, objectCollection)
		objectCollection.each do |obj|
			if obj.getName().downcase() == objectName
				return obj
			end
		end
		return nil
	end
	
	def canSee?()
		return !@currentRoom.isDark?() || hasLight?()
	end
	
	def hasLight?()
		@inventory.each do |obj|
			if obj.getLightPower() > 0
				return true
			end
		end

		@currentRoom.getObjects().each do |obj|
			if obj.getLightPower() > 0
				return true
			end
		end
		return false
	end
	
	def resetCurrentRoomStates()
		@currentRoom.getObjects().each do |obj|
			if obj.is_a?(Snake)
				obj.resetState()
			end
		end
	end
end