Given(/^the library has (\d+) books without the word "(.*?)" in the title$/) do |nonMatchingBookCount, searchWord|
  @library = Library.new
  @library.addTitle("Much Ado About Nothing")
  @library.addTitle("Hamlet")
  @library.addTitle("Carrot Farming")
  @library.addTitle("Potato Farming")
  @library.addTitle("Dragon Farming")
  @library.addTitle("Lamps and You")
  @library.addTitle("Potato Lamps for Dummies")
  @library.addTitle("The Necronomicon")
  @library.addTitle("Intro to ASM")
  @library.addTitle("Intro to C")
  @library.addTitle("Intro to Java")
  @library.addTitle("Intro to Lisp")
end

Given(/^there are (\d+) books, "(.*?)" and "(.*?)", that each have "(.*?)" in the title$/) do |matchingBookCount, matchingBook1, matchingBook2, searchWord|
  
end

When(/^I search for "(.*?)"$/) do |searchWord|
  @searchResults = @library.search(searchWord)
end

Then(/^I should see the following books:$/) do |table|
  puts "#{@searchResults}"
end