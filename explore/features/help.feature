Feature: help
  In order to know my capabilities
  As an explorer
  I want to get a list of commands
  
  Scenario: help
	Given I am exploring
	When I ask for help
	Then I should see a list of commands
