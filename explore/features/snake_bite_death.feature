Feature: Snake - Bite, Death
  In order to make things challenging
  As an explorer
  I want to get bit by a snake and die
  
  Scenario: Snake - Bite, Death
	Given I am exploring
	And there is a snake in the room
	When I look
	Then I should see a description of the room
	And the snake should hiss
	When I look
	Then the snake should attack
	When I look
	Then the poison should get worse
	And the snake should watch carefully
	When I look
	Then I should see a description of the room
	And I should die by snake bite
	And the snake should watch carefully
	And I should stop exploring