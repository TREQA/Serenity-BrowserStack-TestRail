Feature: An input quantity field, an add button and a stock availability icon must be displayed.
  Rules:
  -Input field is displayed only if displayed only if ATTR_BUYABLE="yes"
  -Add to cart button is displayed only if displayed only if ATTR_BUYABLE="yes"
  -Input field must accept only integers
  -If ATTR_ALLIANCE_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -If ATTR_MOSS_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -The default value should be the Lowest Standard Pack
  -If the quantity is not a multiple of the Standard pack (when it is required) an error message should be displayed
  -Error messages for input quantity will be displayed in red color, below the input

  Scenario: The input quantity field and Add to cart button are not displayed
    Given the actor is on a Product group page Screw
    And for the SKU ATTR_BUYABLE="no"
    Then input quantity field and Add to cart button are not displayed

  Scenario: The input quantity field default value is the Lowest Standard Pack
    Given the actor is on a Product group page Screw
    And for the SKU ATTR_BUYABLE="yes"
    Then the default value in the input quantity field is the Lowest Standard Pack

  @regression
  Scenario: The input field must accept only integers
    Given the actor is on a Product group page Screw
#    And for the SKU ATTR_BUYABLE="yes"
    When the actor inputs a non integer value
    Then an error message will be displayed under the input field
    And the error text must be red

  Scenario: When the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA is set to “No” then the user can only input multiples of the Standard Pack
    Given the actor is on a Product group page Screw
#    And for the SKU ATTR_BUYABLE="yes"
    And the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA is set to No
    When the user inputs a number which is not a multiple of the Standard pack
    Then an error message is displayed

  Scenario: A tool-tip is displayed when hovering over the icon
    Given the actor is on a Product group page Screw
    When the actor hovers the courser over the icon
    Then a tool-tip text is displayed

  @regression
  Scenario: Icon is green when the status is “In Stock”
    Given the actor is on a Product group page Screw
    And the availability of a SKU is “In Stock”
    Then the Availability icon is green

  @regression
  Scenario: Icon is amber when the SKU availability is “In Production”
    Given the actor is on a Product group page Screw
    And the availability of a SKU is “In Production”
    Then the Availability icon is amber

  Scenario: If there is only one result page, the pagination section will show a 1
    Given the actor is on a Product group page Screw
    And there is only one SKU result page
    Then '1' is displayed in the pagination section

#  Scenario: If there are more than 3 pages the pagination will display 1 2 3 ...[last page number] and the current page is highlighted in Red
#    Given the actor is on a Product group page Screw
#    And there are more than 3 SKU result pages
#    Then 1 2 3 ... [last page number] sequence is displayed
#    And the current page is highlighted in Red

  @regression
  Scenario: A dropdown for selecting number of results displayed on page is present and defaults to 20. The options are always 20/40/60/80/100/All
    Given the actor is on a Product group page Screw
    Then a dropdown for selecting the number of results displayed per page is present
    And the options are 20/40/60/80/100/All
    And the default value is 20

  @regression
  Scenario: Using a sort action on any attribute will sort the result page accordingly
    Given the actor is on a Product group page Screw
    When a sorting action is used
    Then the SKU list is sorted accordingly