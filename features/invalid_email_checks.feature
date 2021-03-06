Feature: Invalid email address entry checks
  As a user I want to be informed if the information I'm providing is invalid
  So that I can correct any mistakes I've made

  Background:
    Given I've chosen my data to return
    And I confirm my details are correct

  Scenario: Invalid email address is entered
    When I submit an invalid email address
    Then I am shown the DR2050 error

  Scenario: No email address is entered
    When I don't enter an email address
    Then I am shown the DR2050 error

  Scenario: Same email address used multiple times
    Then I enter the same email address too many times and it gets blocked