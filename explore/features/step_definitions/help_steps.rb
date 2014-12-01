When(/^I ask for help$/) do
  @helpResults = @commandProcessor.process("help")
end

Then(/^I should see a list of commands$/) do
  expect(@helpResults).to(include("help [command]"))
end