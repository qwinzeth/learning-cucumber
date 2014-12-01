When(/^I quit$/) do
  @commandProcessor.process("quit")
end

Then(/^I should stop exploring$/) do
  expect(true).to(eq(@commandProcessor.isQuitting?))
end