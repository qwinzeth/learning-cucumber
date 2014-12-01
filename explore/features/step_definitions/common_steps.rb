Given(/^I am exploring$/) do
  @rooms = [Room.new("Room 1", "A stone room."), Room.new("Room 2", "A wood room.")]
  @rooms[0].setDark(false)
  @rooms[1].setDark(false)
  @explorer = Explorer.new(@rooms[0])
  @commandProcessor = CommandProcessor.new(@explorer, @rooms)
end

