Feature: Items added to the basket should display the following:
  Image, Item Code, Quantity (with an option to Update), cost and remove option for each item
  When updating the quantity the total price for an item is calculated based on unit price * quantity
  Items should be displayed in reverse chronological order
  The following options should be present (as labels at the moment): Save Basket, Print Basket, Request a Quote, Checkout and Enter a Promo code


  Scenario: Each item present in the basket should have an Image, Item Code, Quantity with an Update option, Cost and Remove option
    Given the user is on the Basket page
    And there are items present in the basket
    Then each item must have an Image, Item code, Quantity, Update quantity, Cost and Remove option


  Scenario: Clicking on the item code redirects the user to the SKU page
    Given the user is on the Basket page
    And there are items present in the basket
    When the user clicks on an items Code
    Then the user is redirected to that item SKU page


  Scenario: After updating the quantity of an item, the cost should reflect the unit price * quantity
    Given the user is on the Basket page
    And there are items present in the basket
    When the user updates the quantity of any item
    Then the cost reflects the unit prices times the quantity formula


  Scenario: All items are displayed in reverse chronological order of their addition to the cart (newest first)
    Given the user is on the Basket page
    And there are items present in the basket
    Then the items are displayed in reversed chronological order of the time of their addition to the basket

  Scenario: Save Basket, Share Basket, Print Basket, Request Quote, Checkout and Enter a promo code option should be present in the Basket page
    Given the user is on the Basket page
    And there are items present in the basket
    Then Save Basket, Share Basket, Print Basket, Request Quote, Checkout and Enter a promo code option should be present