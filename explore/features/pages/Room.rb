class Room
	def initialize(name, description)
		@name = name
		@objects = []
		@exits = []
		@baseDescription = description
		@dark = true
	end
	
	def getName
		return @name
	end
	
	def isDark?()
		return @dark
	end
	
	def setDark(newDark)
		@dark = newDark
	end
	
	def getDescription()
		description = String.new(@baseDescription)
		if @exits.length == 0
			description << " There are no exits."
		else
			@exits.each do |exit|
				description << " There is an exit #{exit.getName()}."
			end
		end
		return description
	end
	
	def getExitRoom(exitName)
		@exits.each do |exit|
			if exit.getName() == exitName
				return exit.getRoom()
			end
		end
		return nil
	end
	
	def addTwoWayExit(exitName, exitRoom, returningExitName)
		@exits << Exit.new(exitName, exitRoom)
		exitRoom.addOneWayExit(returningExitName, self)
	end
	
	def addOneWayExit(exitName, exitRoom)
		@exits << Exit.new(exitName, exitRoom)
	end
	
	def addObject(newObject)
		@objects << newObject
	end
	
	def getObjects
		return @objects
	end

	def removeObject(objectName)
		obj = nil
		
		i = 0
		while i < @objects.length
			if @objects[i].getName().downcase() == objectName && @objects[i].isObtainable?
				obj = @objects[i]
				@objects.delete_at(i)
				break
			end
			i += 1
		end
		
		return obj
	end
end