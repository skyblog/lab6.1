

When(/^I click "New Post" link$/) do 
	click_on "New Post"
   # express the regexp above with the code you wish you had
end

When(/^I fill "(.*?)" as Title$/) do |title|
  @title = title
  fill_in "Title", :with => title
  # express the regexp above with the code you wish you had
end

When(/^I fill "(.*?)" as content$/) do |content|
  fill_in "Content", :with => content
   # express the regexp above with the code you wish you had
end

When(/^I click "(.*?)" button$/) do |btn|
  click_on btn # express the regexp above with the code you wish you had
end


Then(/^I should see the blog I just posted$/) do
  page.should have_content(@title)
   # express the regexp above with the code you wish you had
end
