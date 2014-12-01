Feature: Search
  In order to search
  As a patron of the library
  I want to find a book

  Scenario: Search by title
    Given the library has 10 books without the word "potato" in the title
	And there are 2 books, "Potato Farming" and "Potato Lamps for Dummies", that each have "potato" in the title
	When I search for "potato"
	Then I should see the following books:
	  | Book Title |
	  | "Potato Farming" |
	  | "Potato Lamps for Dummies" |