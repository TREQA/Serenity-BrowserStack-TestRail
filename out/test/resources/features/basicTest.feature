Feature: Verify that a basic test can be implemented
  In order to use this framework
  As a basic automation tester
  I must be able to understand and implement it properly

  Scenario: Starting practice on selenium
    Given I am on the selenium website homepage for test
    When I click start practising
    And I select the category "Select Dropdown List"
    Then I am on "Select List Demo" page

  @debug
  Scenario: Serenity wait tests
    Given I am on the selenium website download page
    And I click on Download File
    Then I click on Close button when download is finished