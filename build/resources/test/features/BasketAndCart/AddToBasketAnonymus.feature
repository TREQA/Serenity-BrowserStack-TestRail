Feature: Add to cart functionality must be present on SKU pages and on the SKU table entries on PDP pages.
  -The user is able to add to cart after the value withing the Quantity field is higher than 0
  -"Total x in your cart" message, as well as a view cart button, must be shown once the user uses the Add to cart button
  -Clicking on View cart will redirect the user to the Basket page
  -Items in the Basket must be persistent accorss user sessions
  -The message for adding items to a cart must be manageable via the Site Configuration file.

  @prep
  Scenario: Add to cart button must be present and functional on SKU pages
    Given the actor is on a SKU details page XS
    Then a Add to Cart button is present

  @prep
  Scenario: Add to cart button must be present and functional on the expanded view of SKU entries in the SKU Summary list table
    Given the actor is on a Product group page Screw
    Then an Add to Cart button is present on each SKU entry from the SKU Summary list table when expanded

  @prep
  Scenario: The user can use the Add to Cart button once the value in the Input Quantity field is over 0
    Given the actor is on a SKU details page XS
    And the value in the input quantity field is over 0
    Then using the Add to Cart button will add the specified quantity of that SKU to the user basket

  @prep
  Scenario: The user can use the Add to Cart button once the value in the Input Quantity field is over 0
    Given the actor is on a Product group page Screw
    And the value in the input quantity field of the sku is over 0
    Then using the Add to Cart button of the SKU will add the specified quantity of that SKU to the user basket

  @prep
  Scenario: Once the user successfully adds items to the Basket a message stating "Total x in your cart" and a View Basket button are displayed.
    Given the actor is on a SKU details page XS
    When items are added to cart successfully
    Then a message stating "Total x in your cart" is shown
    And a View Basket button is shown

  @prep
  Scenario: Once the user successfully adds items to the Basket a message stating "Total x in your cart" and a View Basket button are displayed.
    Given the actor is on a Product group page Screw
    When items are added to the cart successfully
    Then the message stating "Total x in your cart" is shown
    And the View Basket button is shown

  Scenario: Items in the basket must be persistent across sessions.
    Given the actor is on a SKU details page XS
    And the user basket has items
    When the user visits other websites and then returns to the Essentra site
    Then the items are still present in the Basket

