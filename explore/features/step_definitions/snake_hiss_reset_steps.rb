Then(/^the snake should hiss again$/) do
	expect(@goResults).to(include("The snake hisses!"))
end