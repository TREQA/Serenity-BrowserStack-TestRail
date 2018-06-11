Feature: The demo covers a complete basic user flow from registration to checkout (checkout action not included)


  Scenario: Registration - Bad credentials
    Given the user is on the registration page
    When introducing bad credetials
    Then invalid fields are highlighted in red

  @demo
  Scenario: Registration - Good credentials
    Given the user is on the registration page
    When introducing correct credentials and completes registration
    Then registration is successful

  @demo
  Scenario: Login
    Given the user is on the Login page
    When introducing correct credentials
    Then login is successful

  @demo
  Scenario: Visit Product Group and add a SKU
    Given the actor is on a Product group page Screw
    When he adds a SKU to the Cart
    Then the minicart is updated with the added items

  @demo
  Scenario: Visit a SKU and add it to cart
    Given the actor is on a SKU details page XS
    When he adds the SKU to the Cart
    Then the minicart is updated with the added item

  @demo
  Scenario: Update on items quantity and remove another item
    Given the user is on the Basket page
    When he updates the quantity for the first item
    And removes the second item
    Then the information from within the cart is updated accodingly