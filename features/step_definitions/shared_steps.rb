When(/^I visit "(.*?)"$/) do |desired_page|
  visit(desired_page)
end

When(/^I type "(.*?)" into "(.*?)"$/) do |text, field|
  fill_in field, with: text
end

When(/^I click "(.*?)"$/) do |target|
  click_button(target)
end

When(/^I pick "(.*?)" from "(.*?)"$/) do |item, select_box|
  select(item, :from =>  select_box)
end

When(/^I press on the "(.*?)"$/) do |target|
  click_link(target)
end

When(/^I click button "(.*?)"$/) do |target|
  click_link(target)
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end


