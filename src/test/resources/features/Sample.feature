Feature: Example for Template

  @prep @TestRailId-###
  Scenario: When Searching for anything on Google, results are displayed
    Given the user is on the Google page
    When anything is searched
    Then results are shown