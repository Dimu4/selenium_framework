Feature: Testing postal calculator options

  @print_states
  Scenario: Print available states
    Given I open a browser with url "https://tools.usps.com/go/ZipLookupAction!input.action"
    And I will print in terminal available states

  Scenario: Refactoring home url
    Given I open an find a zip code page

  Scenario: Print available states
    Given I open a browser with url "https://tools.usps.com/go/ZipLookupAction!input.action"
    And I will select "CA - California" state

  Scenario: Find zip Code
    Given I open an find a zip code page
    When I type "1044 Middlefield Road" as street address
    When I type "Redwood City" as city
    When I will select "CA - California" state
    And click Find button
    Then I will get my zip code

  @zip
  Scenario Outline: Find zip Code for multiple cities
    Given I open an find a zip code page
    When I type "<street>" as street address
    When I type "<city>" as city
    When I will select "<state>" state
    And click Find button
    Then I should get my zip code "<zip_code>"
  Examples:
    | street                | city         | state                     | zip_code |
    | 1044 Middlefield Road | Redwood City | CA - California           | 94063    |
    | 1600 Pennsylvania Ave | Washington   | DC - District of Columbia | 20500    |
    | 3600 S Las Vegas Blvd | Las Vegas    | NV - Nevada               | 89109    |

