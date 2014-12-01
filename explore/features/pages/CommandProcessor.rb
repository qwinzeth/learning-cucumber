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
		if subject == nil
			return "Usage: get ITEM_IN_ROOM"
		end
		if @explorer.addObjectToInventory(subject)
			return "Got #{subject}."
		else
			return "Unable to obtain #{subject}."
		end
	end

	def go(subject)
		if @explorer.goExit(subject)
			goResult = "You exit #{subject}.\n"
			goResult << look(nil)
			return goResult
		end
		return "Unable to exit #{subject}."
	end
	
	def help(subject)
		helptext = ""
		if subject == nil
			helptext = "get ITEM_IN_ROOM\n"
			helptext << "go EXIT\n"
			helptext << "help [command]\n"
			helptext << "light ITEM_CARRIED\n"
			helptext << "look [ITEM_CARRIED|items]\n"
			helptext << "quit\n"
		end
		return helptext
	end
	
	def light(subject)
		if subject == nil
			return "Usage: light ITEM_CARRIED"
		elsif @explorer.lightObject(subject)
			return "Lit #{subject}."
		else
			return "Unable to light #{subject}"
		end
	end
	
	def look(subject)
		if subject == nil
			return "#{@explorer.getCurrentRoomDescription()} Objects in this room: #{@explorer.look()}"
		elsif subject == "items"
			return @explorer.getObjectNames()
		end
		return @explorer.lookObject(subject)
	end
	
	def quit(subject)
		@quitting = true
		return "Goodbye."
	end
	
	def talk(subject)
		if subject == nil
			return "You mutter to yourself."
		end
		return @explorer.talkTo(subject)
	end
end