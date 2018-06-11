
Feature: The CMS Solution must have the provision to Configure different Page Types.

  Scenario: Management of Page Types must be a developer activity
    Given the user is on the Magnolia CMS page logged with a Business account
    When attempting to create or modify a page
    Then permission is not granted for that action

  Scenario: Page type definitions will be part of a centralized repository and must be available to all content catalogues
    Given the user is on the CMS Pages section
    When attempting to create a new Page Instance
    Then all Page Types are displayed to the user

  Scenario: All Page Types must have the following properties: ID, Name, Template List, Structure Data ID and URL Creation flag
    Given the user is on the CMS Pages section
    When attempting to create a new Page Instance
    Then all Page Types will display the following properties: ID, Name, Template List, Structure Data ID and URL Creation flag