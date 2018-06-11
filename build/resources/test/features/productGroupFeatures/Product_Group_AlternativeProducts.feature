Feature:Alternate Products must display an Image and a Title which links to the page of the product (either Product Group or SKU details page)

  @regression
  Scenario: An Alternative Product section is displayed
    Given the actor is on a Product group page Lift
    Then Alternative Products section is displayed

  @regression
  Scenario: Alternative products have image and title
    Given the actor is on a Product group page Lift
    Then each item in the Alternative Products displays a title and an image

  @regression
  Scenario: Clicking on the item title sends the actor to its details page
    Given the actor is on a Product group page Lift
    When the actor clicks on the alternative item title
    Then the actor is taken to the clicked item page