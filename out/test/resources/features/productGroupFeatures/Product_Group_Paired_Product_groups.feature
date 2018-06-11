

Feature: Paired Product group section is displayed and for each paired Product group a Title, Image and description are displayed
  Rules
  -Image size is 140x140px, if no image is configured, a default background is displayed
  -If the title exceeds the space allocated to the item content block, text will be wrapped
  -Title must be an URL which redirects the user to the Product group page
  -If the description exceeds the space allocated to the item content block, text will be wrapped
  -If the description exceeds the maximum character allocated for the content block text will be truncated

  Scenario: Paired Product group has title, image and description
    Given the actor is on a Product group page
    And that Product group has a Paired Product group
    Then the Paired Product group has a Title, Image and Description

  Scenario: Paired Product group title is an URL that leads the actor to the Paired Product group page.
    Given the actor is on a Product group page
    And that Product group has a Paired Product group
    When the actor clicks on the Paired Product group Title
    Then the actor is redirected to the Paired Product group page

  Scenario: Image size is 140x140px
    Given the actor is on a Product group page
    And that SKU has a Paired Product group
    And that Paired Product group has an image configured
    Then Paired Product group image has 140x140px resolution

  Scenario: The Description text is wrapped if it exceeds the allocated space in the item content block
    Given the actor is on a Product group page
    And that Product group has a Paired Product group
    And that Paired Product group has a description which exceeds the space allocated in the item content block
    Then the Description text of the Paired Product group is wrapped

  Scenario: The Description text is truncated when the Description text exceeds the maximum character limit
    Given the actor is on a Product group page
    And that Product group has a Paired Product group
    And that Paired Product group has a description which exceeds the maximum character limit
    Then the description of the Paired Product group is truncated
