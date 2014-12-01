Feature: go
  In order to go somewhere new
  As an explorer
  I want to leave my current room for a new one
  
  Scenario: help
	Given I am exploring
	And the room I am in has a two way exit "north" and "south"
	When I go "north"
	Then I should go to that room
	And that room should have an exit "south"