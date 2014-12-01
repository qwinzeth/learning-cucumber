Feature: look in a dark room
  In order to require light
  As an explorer
  I want to not see in a dark room without a light source
  
  Scenario: get unobtainable
	Given I am exploring
	And I am in a dark room
	When I look
	Then I should not see anything
	But if a lit torch is in the room
	When I look
	Then I should see a description of the room
