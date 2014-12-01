Feature: Multiplication
  In order to do multiplication
  As an average person
  I want to multiply some numbers
  
  Scenario: Multiply numbers
    Given I have entered 50 into the calculator
	And I have entered 70 into the calculator
	And I have entered 314 into the calculator
	When I press multiply
	Then the result should be 1099000 on the screen
