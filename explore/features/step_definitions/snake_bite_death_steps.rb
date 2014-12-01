Given(/^there is a snake in the room$/) do
  @rooms[0].addObject(Snake.new())
end

Then(/^the snake should hiss$/) do
  expect(@lookResults).to(include("The snake hisses!"))
end

Then(/^the snake should attack$/) do
  expect(@lookResults).to(include("The snake bites!"))
end

Then(/^the poison should get worse$/) do
  expect(@lookResults).to(include("Your poison gets worse"))
end

Then(/^the snake should watch carefully$/) do
  expect(@lookResults).to(include("The snake watches you carefully"))
end

Then(/^I should die by snake bite$/) do
  expect(@lookResults).to(include("You die"))
end