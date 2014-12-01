Feature: talk
  In order to gather information
  As an explorer
  I want to talk to people
  
  Scenario: look
	Given I am exploring
	And there is a person named "Bob" in the room
	When I talk "bob"
	Then I should see a conversation
