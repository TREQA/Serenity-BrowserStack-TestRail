Feature: A "Summary" label, Total price of the added products must be shown on the Basket page when there are products added to the Basket
  -Total price should equal the number of added items * unit price
  -When a product is removed or the quantity of a product is updated then the total cost will be updated accordingly

  Scenario: A "Summary" label and a Total price of the added products must be displayed on the Basket page when there are items present in the cart.
    Given the user added items to the cart and accesses the Basket page
    Then Summary label and Total price are displayed

  Scenario: When the user removed an item from the Basket then the Total is updated accordingly.
    Given the user added items to the cart and accesses the Basket page
    When an item is removed from the Basket
    Then the Total price is updated to reflect the change

  Scenario: When the user updates the quantity of any of the items in the Basket then the Total price is updated accordingly
    Given the user added items to the cart and accesses the Basket page
    When the quantity of an item is updated
    Then the Total price is updated to reflect the change