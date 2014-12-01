Given(/^I am in a dark room$/) do
  @rooms << Room.new("Dark Room", "A plain stone room.")
  @rooms[2].setDark(true)
  @rooms[0].addTwoWayExit("north", @rooms[2], "south")
  expect(@commandProcessor.process("go north")).to(include("You exit north"))
end

Then(/^I should not see anything$/) do
  expect(@lookResults).to(include("It is too dark to see anything."))
end

Then(/^if a lit torch is in the room$/) do
  litTorch = Torch.new()
  litTorch.light()
  @rooms[2].addObject(litTorch)
end