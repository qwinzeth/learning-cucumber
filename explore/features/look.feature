Feature: look
  In order to look around a room
  As an explorer
  I want to know what is in the room
  
  Scenario: look
	Given I am exploring
	And I am not blind
	And there is a "torch" in the room
	When I look
	Then I should see a description of the room
    And I should see the following objects:
      |torch|
