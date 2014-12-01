Given(/^there is a snake in the room$/) do
  @rooms[0].addObject(Snake.new())
end

Then(/^the snake should attack$/) do
  expect(@lookResults).to(include("The snake bites!"))
end