Feature: Snake - Bite, Death
  In order to make things challenging
  As an explorer
  I want to get bit by a snake and die
  
  Scenario: Snake - Bite, Death
	Given I am exploring
	And there is a snake in the room
	When I look
	Then I should see a description of the room
	And the snake should attack
	When I look
	Then I should see a description of the room
	And I should die by snake bite