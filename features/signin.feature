@signin
Feature: Testing Sign In feature

  Background:
    Given I open an home page
    When I click on Sign In link

  Scenario: User can be sign in with correct credentials
    And I type "bayqatraining@gmail.com" as a login and "root1234" as a password
    Then I should see "Hi, Aleks" in login section
    When I will click on Sign Out
    Then I should see "Register / Sign In" in login section


  Scenario: Minimum login length should be 6 symbols
    And I type "12345" as a login and "root1234" as a password
    Then I should see sign in error "Your Username must be at least 6 characters long."


  Scenario: Login field should not be empty
    And I send login and password for user "empty_login"
    Then I should see sign in error "A Username is a required entry."

  Scenario Outline: Verify sign in errors
    And I send login and password for user "<username>"
    Then I should see sign in error "<error_message>"

  Examples:
    | username       | error_message                                     |
    | empty_login    | A Username is a required entry.                   |
    | empty_password | A password is required.                           |
    | short_login    | Your Username must be at least 6 characters long. |




