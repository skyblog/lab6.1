Given(/^there is a post with title "(.*?)" and content "(.*?)"$/) do |title, content|
  @post=Post.create!({ :title => "title", :content => "content", :post_time=> Time.now})
   # express the regexp above with the code you wish you had
end

When(/^I edit this post$/) do
  click_link("Edit", :href=>"/posts/#{@post.id}/edit")
end

When(/^I update title to "(.*?)" and content to "(.*?)"$/) do |title,content|
  @titlex,@contentx=title, content
  fill_in "Title", :with => title
  fill_in "Content", :with => content
  click_button("Update Post")
   # express the regexp above with the code you wish you had
end

Then(/^I can see it has been updated$/) do
  page.should have_content(@titlex)
  page.should have_content(@contentx)
   # express the regexp above with the code you wish you had
end

