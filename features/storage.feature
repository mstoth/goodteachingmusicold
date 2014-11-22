
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
	

Scenario: Approving a piece
	Given I am on the home page
	When I click on the "Enter a Favorite of Yours" button
	Then I should see the new piece form
	When I fill out the new piece form
	And I click on the "Create Piece" button
	Then I should see "Piece was successfully created. It will appear after approval."
	And I should not see the piece displayed
	When I view unapproved pieces
	Then I should see the piece listed
	When I click on "Approve"
	Then I should see "Piece is now approved." 
	And I should see the piece listed
	And I should not see an Edit button
	

Scenario: Changing Instrument
	Given I am on the home page
	And I select a new instrument
	And I click on the "Update Table" button
	Then I should see only music for that instrument
	
	
		