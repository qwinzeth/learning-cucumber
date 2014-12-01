#!/c/Ruby21-x64/bin/ruby.exe
require('./features/pages/CommandProcessor.rb')
require('./features/pages/Exit.rb')
require('./features/pages/Explorer.rb')
require('./features/pages/Room.rb')
require('./features/pages/ExObjs/ExObj.rb')
require('./features/pages/ExObjs/Person.rb')
require('./features/pages/ExObjs/Snake.rb')
require('./features/pages/ExObjs/Torch.rb')

rooms = []
rooms << Room.new("Starting Room", "An underground cave.")
rooms[0].addObject(Torch.new())
rooms[0].addObject(Person.new("Bill", "Be careful!"))
rooms[0].setDark(false)

rooms << Room.new("Room 2", "An underground tunnel.")
rooms[0].addTwoWayExit("east", rooms[1], "west")
rooms[1].addObject(Snake.new())

rooms << Room.new("Room 3", "A fork in the cave.")
rooms[1].addTwoWayExit("east", rooms[2], "west")

explorer = Explorer.new(rooms[0])

commandProcessor = CommandProcessor.new(explorer, rooms)

puts(commandProcessor.process("look"))
puts("Type 'help' for help.")
while !commandProcessor.isQuitting?()
	print "Command: "
	command = gets().strip().downcase()
	puts commandProcessor.process(command)
end