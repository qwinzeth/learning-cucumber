When(/^I get "(.*?)"$/) do |arg1|
  expect(@commandProcessor.process("get #{arg1}")).to(eq("Got #{arg1}."))
end

Then(/^I should have a "(.*?)" in my inventory$/) do |arg1|
  expect(@commandProcessor.process("look items")).to(include("#{arg1}"))
end

Then(/^the room should have one less "(.*?)"$/) do |arg1|
  expect(@commandProcessor.process("look")).not_to(include("#{arg1}"))
end