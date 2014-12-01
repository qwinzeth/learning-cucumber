Given(/^I have a "torch"$/) do
  @explorer.addObject(Torch.new())
  expect(@commandProcessor.process("look torch")).to(eq("An unlit torch."))
end

When(/^I "light torch"$/) do
  expect(@commandProcessor.process("light torch")).to(eq("Lit torch."))
end

Then(/^the "torch" should be lit$/) do
  expect(@commandProcessor.process("look torch")).to(eq("A lit torch."))
end