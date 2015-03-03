Given(/^I am not logged in$/) do
  # not logged in
end


Given(/^I have a valid account$/) do
  User.create!(email: 'test@example.com', password: '12345678')
end

Given(/^I am not in$/) do
  pending # express the regexp above with the code you wish you had
end



