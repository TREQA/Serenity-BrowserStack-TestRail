Feature: Minibasket must be present on the Header component and on hover it should display the Cart Summary
  On hover:
  If no products, catalogues or samples are added then the following message is shown: "Looks like your cart is empty!"
  If there are items added into the cart then it displays the message "There are x items in your basket" and show them in chronological order
  For each item added to the basket: primary image, unit price, total price, added quantity, remove option, sub-total cost for all items added in the basket
  When there are more than 5 items in te basket, only the most recent 5 are shown in chronological order together with an option to show "more items"
  If Remove option is used the next item in the queue will be shown in the list instead
  clicking on Open cart button will redirect the user to the Basket page

  Scenario:: Mini Basket is present in the Header section
    Given the user is on any page within the website
    Then a mini basket is displayed in the Header section

  Scenario: Cart summary is displayed when the user hover over the Mini Basket
    Given the user is on any page within the website
    When hovering over the Mini Basket
    Then the cart summary is displayed

  Scenario: "Looks like your cart is empty!" message is displayed in the cart summary when there are no items added to the cart
    Given the user is on any page within the website
    And no items have been added to the cart
    Then the "Looks like your cart is empty!" message is displayed

  Scenario: If there are items in the basket a message stating "There are x items in your basket" is displayed for each item and the items are in chronological order
    Given the user is on any page within the website
    And there are items added to the cart
    Then "There are x items in your basket" message is displayed for each item
    And the items are listed in reverse chronological order

  Scenario: Each item in the cart has a primary image, unit price, total price, added quantity and remove option
    Given the user is on any page within the website
    And there are items added to the cart
    Then each item has a primary image, unit price, total price, added quantity and remove option

  Scenario: Sub total for all the items in the basket is displayed
    Given the user is on any page within the website
    And has items added to the cart
    Then a subtotal is displayed which reflects the cost of all items present in the basket

  Scenario: When there are more than 5 items added to the cart, the last 5 added items are displayed together with a "view more" option
    Given the user is on any page within the website
    And more than 5 items are present in the cart
    Then only the last 5 added items are shown
    And a view more button is displayed

  Scenario: When the remove item option is used, the selected item is no longer shown in the list, the item list is refreshed and the total cost of the items in the basket is updated.
    Given the user is on any page within the website
    And there are items in the basket
    When the user uses the remove option on an item
    Then the item is removed from the list
    And the list is refreshed
    And the sub total cost reflects the removal of that item