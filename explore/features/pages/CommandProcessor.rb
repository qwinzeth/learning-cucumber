class CommandProcessor
	def initialize(explorer, rooms)
		@explorer = explorer
		@rooms = rooms
		@quitting = false
	end
	
	def isQuitting?()
		return @quitting
	end
	
	def process(command)
		splitCommand = command.split(' ', 2)
		verb = splitCommand[0]
		subject = nil
		if splitCommand.length > 0
			subject = splitCommand[1]
		end
	
		if verb == "get"
			return get(subject)
		elsif verb == "go"
			return go(subject)
		elsif verb == "help"
			return help(subject)
		elsif verb == "light"
			return light(subject)
		elsif verb == "look"
			return look(subject)
		elsif verb == "quit"
			return quit(subject)
		elsif verb == "talk"
			return talk(subject)
		else
			return "Unknown command: #{verb}"
		end
	end
	
private
	def get(subject)
		getResult = ""
		if subject == nil
			return "Usage: get ITEM_IN_ROOM"
		else
			if @explorer.addObjectToInventory(subject)
				getResult = "Got #{subject}."
			else
				return "Unable to obtain #{subject}."
			end
		end
		
		getResult += @explorer.timerTick()
		if(getResult.include?("You die"))
			@quitting = true
		end
		return getResult
	end

	def go(subject)
		goResult = "Unable to exit #{subject}."
		if @explorer.goExit(subject)
			goResult = "You exit #{subject}.\n"
			goResult << look(nil)
		end
		return goResult
	end
	
	def help(subject)
		helptext = ""
		if subject == nil
			helptext = "\nget ITEM_IN_ROOM\n"
			helptext << "go EXIT\n"
			helptext << "help [command]\n"
			helptext << "light ITEM_CARRIED\n"
			helptext << "look [ITEM_CARRIED|items]\n"
			helptext << "quit\n"
			helptext << "talk\n\n"
		end
		return helptext
	end
	
	def light(subject)
		lightResult = "Usage: light ITEM_CARRIED"
		if subject == nil
			return lightResult
		end
		if @explorer.lightObject(subject)
			lightResult = "Lit #{subject}."
		else
			return "Unable to light #{subject}"
		end

		lightResult += @explorer.timerTick()
		if(lightResult.include?("You die"))
			@quitting = true
		end
		return lightResult
	end
	
	def look(subject)
		lookResult = ""
		if subject == nil
			lookResult = "#{@explorer.getCurrentRoomDescription()} Objects in this room: #{@explorer.look()}"
		elsif subject == "items"
			lookResult = "#{@explorer.getObjectNames()}"
		else
			lookResult = @explorer.lookObject(subject)
		end
		
		lookResult += @explorer.timerTick()
		if(lookResult.include?("You die"))
			@quitting = true
		end
		return lookResult
	end
	
	def quit(subject)
		@quitting = true
		return "Goodbye."
	end
	
	def talk(subject)
		talkResult = "You mutter to yourself."
		if subject != nil
			talkResult = @explorer.talkTo(subject)
		end

		talkResult += @explorer.timerTick()
		if(talkResult.include?("You die"))
			@quitting = true
		end
		return talkResult
	end
end