Given(/^there is "ye flask" in the room$/) do
  yeflask = YeFlask.new()
  @rooms[0].addObject(yeflask)
  expect(@rooms[0].getObjects()).to(include(yeflask))
end

When(/^I get unobtainable "(.*?)"$/) do |arg1|
  expect(@commandProcessor.process("get #{arg1}")).to(eq("Unable to obtain #{arg1}."))
end

Then(/^I should not have "ye flask" in my inventory, because ye flask is firmly bolted onto to a wall \(which is bolted to the rest of the dungeon which is probably bolted to a castle\)$/) do
  expect(@commandProcessor.process("look items")).not_to(include("ye flask"))
end

Then(/^"ye flask" should still be in the room$/) do
  expect(@commandProcessor.process("look")).to(include("ye flask"))
end