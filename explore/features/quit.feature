Feature: quit
  In order to quit exploring
  As an explorer
  I want to give up
  
  Scenario: quit
	Given I am exploring
	When I quit
	Then I should stop exploring