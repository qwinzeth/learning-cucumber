Given(/^the room I am in has a two way exit "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  @exitToName = arg1
  @exitBackName = arg2
  @rooms[0].addTwoWayExit(@exitToName, @rooms[1], @exitBackName)
  expect(@commandProcessor.process("look")).to(include("There is an exit #{@exitToName}"))
end

When(/^I go "(.*?)"$/) do |arg1|
  @goResults = @commandProcessor.process("go #{arg1}")
end

Then(/^I should go to that room$/) do
  expectedGoResults = "You exit #{@exitToName}."
  expect(@goResults).to(include(expectedGoResults))
end

Then(/^that room should have an exit "(.*?)"$/) do |arg1|
  expectedExit = "There is an exit #{@exitBackName}"
  expect(@commandProcessor.process("look")).to(include(expectedExit))
end