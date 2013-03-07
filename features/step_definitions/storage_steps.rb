Given /^I am on the home page$/ do
  visit '/'
  page.should have_content("Favorite Teaching Music")
end

When /^I select "(.*?)"$/ do |arg1|
  click_button(arg1)
end

Then /^I should see the form for entering a piece$/ do
  page.should have_content("New piece")
end

When /^I select "(.*?)" on the form$/ do |arg1|
  click_button(arg1)
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

When /^I fill out the form$/ do
  fill_in 'piece_title', :with=>'Prelude'
  fill_in 'piece_composer', :with=>'Bach'
end

When /^I click on "(.*?)"$/ do |arg1|
  click_link arg1
end

Given /^a piece has been created$/ do
  FactoryGirl.create :piece, :title=>"Prelude", :composer=>"Bach"
end

Then /^I should see the list of pieces$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I select 'Pre\-Baroque'$/ do
  FactoryGirl.create :piece, :title=>"piece title", :composer=>"Monteverdi", :genre=>"Pre-Baroque"
  choose "piece_genre_pre-baroque"
end

Then /^the list should only have pre baroque music$/ do
  page.should have_content("Monteverdi")
end

When /^I click on the "(.*?)" button$/ do |arg1|
  click_button arg1
end

When /^I select 'Easy'$/ do
  choose 'piece_difficulty_easy'
end

Then /^the list should only have easy music$/ do
  Piece.where(:difficulty=>'Elementary').count.should == all("#pieces_table tr").count - 1 # subtract 1 due to header in table
end

Then /^I should see a possible url$/ do
  page.should have_css("#urlguess")
end
