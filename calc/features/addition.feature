Feature: Addition
  In order to do addition
  As an average person
  I want to add some numbers
  
  Scenario: Add numbers
    Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	And I have entered 314 into the calculator
	When I press add
	Then the result should be 434 on the screen
