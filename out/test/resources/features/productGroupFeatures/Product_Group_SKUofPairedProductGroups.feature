

Feature: Paired SKUs section is displayed under the descriptive attributes and for each paired SKU a Title, Image description, quantity and add button
  Rules
  -Image size is 140x140px, if no image is configured, a default background is displayed
  -If the title exceeds the space allocated to the item content block, text will be wrapped
  -Title must be an URL which redirects the user to the SKU page
  -If the description exceeds the space allocated to the item content block, text will be wrapped
  -If the description exceeds the maximum character allocated for the content block text will be truncated

  Rules:
  -Input field must accept only integers
  -If ATTR_ALLIANCE_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -If ATTR_MOSS_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -The default value should be the Lowest Standard Pack
  -If the quantity is not a multiple of the Standard pack (when it is required) an error message should be displayed
  -Error messages for input quantity will be displayed in red color, below the input

  Scenario: Paired SKU has title, image and description
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    Then the Paired SKU has a Title, Image and Description

  Scenario: Paired SKU title is an URL that leads the actor to the Paired SKU page.
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    When the actor clicks on the Paired SKU Title
    Then the actor is redirected to the Paired SKU details page

  Scenario: Image size is 140x140px
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    And that Paired SKU has an image configured
    Then Paired SKU image has 140x140px resolution

  Scenario: The Description text is wrapped if it exceeds the allocated space in the item content block
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    And that Paired SKU has a description which exceeds the space allocated in the item content block
    Then the Description text of the Paired SKU is wrapped

  Scenario: The Description text is truncated when the Description text exceeds the maximum character limit
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    And that Paired SKU has a description which exceeds the maximum character limit
    Then the description of the Paired SKU is truncated




  Scenario: The input quantity field on a Paired SKU default value is the Lowest Standard Pack
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    Then the default value in the input quantity field of the Paired SKU is the Lowest Standard Pack

  Scenario: The input field on a Paired SKU must accept only integers
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    And the actor inputs non integer values in the Paired SKU input quantity field
    Then an error message will be displayed
    And the error text will be red

  Scenario: When the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA is set to “No” then the user can only input multiples of the Standard Pack
    Given the actor is on a Product group page
    And that SKU has a Paired SKU
    And the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA of that Paired SKU is set to No
    When the user inputs a number which is not a multiple of the Standard pack
    Then an error message is displayed

  Scenario: When there are two or less Paired SKU present in the Paired component, no directional arrows are displayed at the edges of the carrousel.
    Given the actor is on a Product group page
    And that SKU has Paired SKUs
    And the number of Paired SKU is 2 or less
    Then directional arrows on the carrousel are not displayed

  Scenario: When there are more than 2 paired SKUs present in the Paired component, directional arrows are displayed.
    Given the actor is on a Product group page
    And that SKU has paired SKUs
    And the number of Paired SKUs is higher than 2
    Then directional arrows on the carrousel are displayed

  Scenario: When using the directional arrows, the carrousel scroll in the arrow direction by one item.
    Given the actor is on a Product group page
    And that SKU has Paired SKUs
    And the number of the Paired SKUs is higher than 2
    When the actor clicks on the directional arrows
    Then the carrousel scrolls in the direction of the arrow by one item
