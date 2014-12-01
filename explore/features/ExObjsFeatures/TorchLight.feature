Feature: Torch - Light
  In order to shed some light on the situation
  As an explorer
  I want to light a torch
  
  Scenario: Torch - Light
	Given I am exploring
	And I have a "torch"
	When I "light torch"
	Then the "torch" should be lit