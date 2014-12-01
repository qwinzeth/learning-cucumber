Given(/^there is a person named "(.*?)" in the room$/) do |arg1|
  @expectedConversation = "Hi, I am Bob!"
  @rooms[0].addObject(Person.new(arg1, @expectedConversation))
end

When(/^I talk "(.*?)"$/) do |arg1|
  @talkResults = @commandProcessor.process("talk #{arg1}")
end

Then(/^I should see a conversation$/) do
  expect(@expectedConversation).to(eq(@talkResults))
end