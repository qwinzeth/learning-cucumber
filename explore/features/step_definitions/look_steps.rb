Given(/^I am not blind$/) do
  
end

Given(/^there is a "torch" in the room$/) do
	@rooms[0].addObject(Torch.new())
end

When(/^I look$/) do
  @lookResults = @commandProcessor.process("look")
end

Then(/^I should see a description of the room$/) do
  expect(@lookResults).to(include("Objects in this room:"))
end

Then(/^I should see the following objects:$/) do |table|
  table.raw.each do |trow|
    trow.each do |tdata|
      expect(@lookResults).to(include(tdata))
	end
  end
end