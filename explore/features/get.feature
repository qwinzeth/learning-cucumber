Feature: get
  In order to pick up stuff
  As an explorer
  I want to get object
  
  Scenario: get
	Given I am exploring
	And there is a "torch" in the room
	When I get "torch"
	Then I should have a "torch" in my inventory
	And the room should have one less "torch"