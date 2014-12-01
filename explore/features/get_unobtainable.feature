Feature: get unobtainable
  In order to not pick up stuff I shouldn't be able to
  As an explorer
  I want to not get an object that is unobtainable
  
  Scenario: get unobtainable
	Given I am exploring
	And there is "ye flask" in the room
	When I get unobtainable "ye flask"
	Then I should not have "ye flask" in my inventory, because ye flask is firmly bolted onto to a wall (which is bolted to the rest of the dungeon which is probably bolted to a castle)
	And "ye flask" should still be in the room