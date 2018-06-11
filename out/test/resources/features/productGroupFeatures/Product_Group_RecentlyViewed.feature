

Feature: A recently viewed Products and SKUs section must be displayed on all SKU details pages.
  Rules:
  -Products/SKUs viewed by the actor in the Current and Previous sessions are displayed
  -Recently viewed Products must display the following: Product group Image - 140x140px (blank background is displayed if no image is configured) and Product Group title which is an URL that points to the Product Group page (wrapped if it exceeds the limit of the content block).
  -Recently viewed SKUs must display the following: SKU Image - 140x140px (blank background is displayed if no image is configured) SKU title which is an URL that points to the SKU page (wrapped if it exceeds the limit of the content block)
  -Displayed items must be in chronological order

  Scenario: Recently viewed Product Groups and SKUs are displayed on Product group pages
    Given the actor is on a Product group page
    And the actor has visited other products or SKUs in the current or previous session
    Then the Recently Viewed Products and SKUs section is displayed

  Scenario: Recently viewed Products or SKUs display a Product Group or SKU Image of 140x140px
    Given the actor is on a Product group page
    And the actor has visited other products or SKUs in the current or previous session
    And the Recently viewed Product or SKU has at least one Product Image
    Then the image for the recently viewed Product or SKU is displayed as 140x140px

  Scenario: Products or SKUs without an Image configured will display a blank background in the container
    Given the actor is on a Product group page
    And the actor has visited other products or SKUs in the current or previous session
    And the Recently viewed Product or SKU does not have an Image conigured
    Then a blank background is displayed in the container

  Scenario: Products and SKUs are displayed in chronological order
    Given the actor is on a Product group page
    And the actor recently visited Other SKU and Product Pages
    Then the displayed order of the Recently viewed Products and SKUs is chronological

  Scenario: If there are less than 5 recently viewed Products/SKUs, they will fill out the carrousel from left to right.
    Given the actor is on a Product group page
    And has recently viewed less than 5 Products or SKUs
    Then the recently viewed products and SKUs will be displayed in the carrousel aligned from left to right
    And no directional arrows are displayed

  Scenario: If the actor has recently viewed 5 Products and SKUs, then the 5 Products/SKUs will be displayed without directional arrows.
    Given the actor is on a Product group page
    And has recently viewed 5 Products or SKUs
    Then recently viewed products and SKUs are displayed in the carrousel
    And no directional arrows are displayed

  Scenario: If the actor has recently viewed more than 5 Products/SKUs, 5 products/skus and directional arrows will be dispayed.
    Given the actor is on a Product group page
    And has recently viewed more than 5 Products or SKUs
    Then the carrousel will display 5 recently viewed Products and SKUs
    And directional arrows are displayed at the left and right edges of the carrousel

  Scenario: Directional arrows scroll through the items on the carrousel by one item when used.
    Given the actor is on a Product group page
    And has recently viewed more than 5 Products or SKUs
    When the actor clicks on the directional arrows
    Then carrousel scrolls in the direction of the arrow by one item
