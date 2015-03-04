Feature: User Auth
In order to use the application
As a user of the app
I want to be able to login or create an account

Background:
  Given I am not in

  Scenario: User must login
    When I visit "/rooms"
    Then I should see "Sign In"

  Scenario: User must have a valid account to login
    When I visit "/users/sign_in"
    And I type "user@example.com" into "email"
    And I type "password" into "password"
    And I click "Log in"
    Then I should see "Invalid email or password"


  Scenario: User can login with a valid account
    And I have a valid account
    When I visit "/users/sign_in"
    And I type "user@example.com" into "Email"
    And I type "password" into "Password"
    And I click button "Log in"
    Then I should see "Signed in Successfully."
    And I should see "Welcome"

  Scenario: User can create an account
  When I visit "/users/sign_up"
  And I type "user@example.com" into "Email"
  And I type "password" into "Password"
  And I type "password" into "Password confirmation"
  And I type "Roel" into "First name"
  And I type "Cantu" into "Last name"
  And I pick "red" from "favorite_color"
  And I click "Sign up"
  Then I should see "Account success"

  Scenario: Press New Meetings Path
  When I visit "/users/meeting"
  And I press on the "new meeting link"
  Then I should see "John Doe" into "Name"
# Write cucumber scenerios that create new meetings
