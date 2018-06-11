

Feature: Paired SKUs section is displayed under the descriptive attributes and for each paired SKU a Title, Image description, quantity and add button
  Rules
  -Image size is 140x140px, if no image is configured, a default background is displayed
  -If the title exceeds the space allocated to the item content block, text will be wrapped
  -Title must be an URL which redirects the user to the SKU page
  -If the description exceeds the space allocated to the item content block, text will be wrapped
  -If the description exceeds the maximum character allocated for the content block text will be truncated

  Each Paired SKU should have an input quantity fields and an add button.
  Rules:
  -Input field must accept only integers
  -If ATTR_ALLIANCE_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -If ATTR_MOSS_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -The default value should be the Lowest Standard Pack
  -If the quantity is not a multiple of the Standard pack (when it is required) an error message should be displayed
  -Error messages for input quantity will be displayed in red color, below the input

  Paired Product group section is displayed and for each paired Product group a Title, Image and description are displayed
  Rules
  -Image size is 140x140px, if no image is configured, a default background is displayed
  -If the title exceeds the space allocated to the item content block, text will be wrapped
  -Title must be an URL which redirects the user to the Product group page
  -If the description exceeds the space allocated to the item content block, text will be wrapped
  -If the description exceeds the maximum character allocated for the content block text will be truncated


  @regression
  Scenario: Paired SKU has title, image and description
    Given the actor is on a SKU details page L
    And that SKU has a Paired SKU
    Then the Paired SKU has a Title, Image and Description

  @regression
  Scenario: Paired SKU title is an URL that leads the actor to the Paired SKU page.
    Given the actor is on a SKU details page L
    And that SKU has a Paired SKU
    When the actor clicks on the Paired SKU Title
    Then the actor is redirected to the Paired SKU details page

  @regression
  Scenario: Image size is 140x140px
    Given the actor is on a SKU details page L
    And that SKU has a Paired SKU
    And that Paired SKU has an image configured
    Then Paired SKU image has 140x140px resolution

  Scenario: The Description text is wrapped if it exceeds the allocated space in the item content block
    Given the actor is on a SKU details page S
    And that SKU has a Paired SKU
    And that Paired SKU has a description which exceeds the space allocated in the item content block
    Then the Description text of the Paired SKU is wrapped

  Scenario: The Description text is truncated when the Description text exceeds the maximum character limit
    Given the actor is on a SKU details page S
    And that SKU has a Paired SKU
    And that Paired SKU has a description which exceeds the maximum character limit
    Then the description of the Paired SKU is truncated


  Scenario: When there are two or less Paired SKU present in the Paired component, no directional arrows are displayed at the edges of the carrousel.
    Given the actor is on a SKU details page S
    And that SKU has a Paired SKU
    And the number of Paired SKU is 2 or less
    Then directional arrows on the carrousel are not displayed

  @regression
  Scenario: When there are more than 2 paired SKUs present in the Paired component, directional arrows are displayed.
    Given the actor is on a SKU details page L
    And that SKU has a Paired SKU
#    And the number of Paired SKUs is higher than 2    -
    Then directional arrows on the carrousel are displayed


  Scenario: When using the directional arrows, the carrousel scroll in the arrow direction by one item.
    Given the actor is on a SKU details page XLS
    And that SKU has a Paired SKU
#    And the number of Paired SKUs is higher than 2
    When the actor clicks on the directional arrows
    Then the carrousel scrolls in the direction of the arrow by one item


  @regression
  Scenario: Paired Product group has title, image and description
    Given the actor is on a SKU details page XS
    And that SKU has a Paired Product group
    Then the Paired Product group has a Title, Image and Description

  @regression
  Scenario: Paired Product group title is an URL that leads the actor to the Paired Product group page.
    Given the actor is on a SKU details page XS
    And that SKU has a Paired Product group
    When the actor clicks on the Paired Product group Title
    Then the actor is redirected to the Paired Product group page

  @regression
  Scenario: Image size is 140x140px
    Given the actor is on a SKU details page XS
    And that SKU has a Paired Product group
    And that Paired Product group has an image configured
    Then Paired Product group image has 140x140px resolution

  Scenario: The Description text is wrapped if it exceeds the allocated space in the item content block
    Given the actor is on a SKU details page S
    And that SKU has a Paired Product group
    And that Paired Product group has a description which exceeds the space allocated in the item content block
    Then the Description text of the Paired Product group is wrapped

  Scenario: The Description text is truncated when the Description text exceeds the maximum character limit
    Given the actor is on a SKU details page S
    And that SKU has a Paired Product group
    And that Paired Product group has a description which exceeds the maximum character limit
    Then the description of the Paired Product group is truncated
