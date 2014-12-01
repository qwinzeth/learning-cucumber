Feature: Empty After Calculation
  In order to do other calculations
  As a calculator user
  I want to clean arguments after a calculation
  
  Scenario: Empty After Calculation
    Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	And I have entered 314 into the calculator
	When I press multiply
	Then the result should be 1099000 on the screen
	Given I have entered 0 into the calculator
	When I press add
	Then the result should be 0 on the screen