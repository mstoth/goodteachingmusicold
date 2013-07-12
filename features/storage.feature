
Feature: storage for favorite teaching music

	In order to collect a list of favorite music for students
	This tool manages a database available to teachers

Scenario: Entering a favorite piece
	Given I am on the home page
	When I select "Enter a Favorite of Yours"
	Then I should see the form for entering a piece
	When I select "Create Piece" on the form
	Then I should see "Composer can't be blank"
	When I fill out the form
	And I select "Create Piece" on the form
	Then I should see "Piece was successfully created"
	And I should see "Favorite Piano Teaching Music"
	
Scenario: Changing the Genre
	Given I am on the home page
	When I select 'Pre-Baroque'
	And I click on the "Update Table" button
	Then the list should only have pre baroque music
	And I should see a possible url
	
Scenario: Changing the Difficulty
	Given I am on the home page
	When I select 'Easy'
	And I click on the "Update Table" button
	Then the list should only have easy music
	
Scenario: Sorting the list
	Given I am on the home page
	When I select 'sort_by_title'
	And I click on the "Update Table" button
	Then the list should be sorted by title
	
Scenario: Entering a new piece
	Given I am on the home page
	When I click on the "Enter a Favorite of Yours" button
	Then I should see the new piece form
	When I fill out the new piece form
	And I click on the "Create Piece" button
	Then I should see "Piece was successfully created"
	
Scenario: Editing an existing piece
	Given I am on the home page
	And a piece exists in the database
	When I click on "Edit"
	Then I should see the edit page
	When I fill in the edit page
	And I click on the "Update" button
	Then I should see "Piece was successfully updated"
	
Scenario: Adding a piece that already exists
	Given I am on the home page
	And a piece exists in the database
	And I click on the "Enter a Favorite of Yours" button
	And I enter the same piece
	And I click on the "Create" button
	Then I should see "Piece must be unique"

Scenario: Adding a piece with an URL for the recording
	Given I am on the home page
	And I click on the "Enter a Favorite of Yours" button
	And I fill in the edit page with a URL
	And I click on the "Create" button
	Then the url link will not be the You Tube search result
	
Scenario: Changing Instrument
	Given I am on the home page
	And I select a new instrument
	And I click on the "Update Table" button
	Then I should see only music for that instrument
	
	
