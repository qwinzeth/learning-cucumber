Feature: Snake - Hiss, Reset
  In order to get past a snake more than once
  As an explorer
  I want to reset the snake's state when I leave the room
  
  Scenario: Snake - Hiss, Reset
	Given I am exploring
	And the room I am in has a two way exit "north" and "south"
	And there is a snake in the room
	When I look
	Then I should see a description of the room
	And the snake should hiss
	When I go "north"
	When I go "south"
	Then the snake should hiss again
