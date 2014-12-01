Given(/^I have entered (.*) into the calculator$/) do |n|
	@calculator ||= Calculator.new
	@calculator.push(n.to_i)
end

When(/^I press add$/) do
  @result = @calculator.add()
end

Then(/^the result should be (\d+) on the screen$/) do |arg1|
  puts(@result)
end