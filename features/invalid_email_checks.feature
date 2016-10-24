Feature: Invalid data entry checks
  As a user I want to be informed if the information I'm providing is invalid
  So that I can correct any mistakes I've made

    Background:
    Given I've chosen my data to return
    And I've confirmed my data

    Scenario: Invalid email address is entered
    When I submit an invalid email address
    Then an error message is shown

    Scenario: No email address is entered
    When I don't enter an email address
    Then an error message is shown