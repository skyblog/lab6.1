Then(/^I can see list of (\d) posted blogs$/) do |count|
  page.should have_selector("table#posts-list>tr:eq(#{count})")
   # express the regexp above with the code you wish you had
end
