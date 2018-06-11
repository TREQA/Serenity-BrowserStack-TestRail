Feature: All the SKU descriptive attributes are displayed
  Rules:
  -Descriptive attributes are displayed as Label and Value
  -Label size is half of description column size
  -Value size is half of description column size
  -If attribute label's length exceeds half of description column size, then attribute label is wrapped
  -If attribute value's length exceeds half of description column size, then attribute value is wrapped
  -If displayable attributes defined at PRODUCT level as ATTR_CAT_DISPLAY_SEQ1 .. 12 have values, then attributes are displayed, in defined order
  -if displayable attributes defined at SKU level with ATTR_ATTRIB_FACET_DISPLAY="yes" have values and are non included in ATTR_CAT_DISPLAY_SEQ, then attributes are displayed, ordered alphabetically by attribute label

  Quantity and Unit Pricing must be displayed on all SKU details pages
  Rules:

  The Price must be per unit
  If item has a predefined standard quantity for order then message "Buy in Multiples of <Standard Pack Size>"is displayed
  if item has not a predefined standard quantity for order then message "Order any quantity"is displayed
  A table with different quantities (multiples of the Standard pack) and the unit price for that quantity must be displayed.

  Quantity and Unit Pricing must be displayed on all SKU details pages
  Rules:

  The Price must be per unit
  If item has a predefined standard quantity for order then message "Buy in Multiples of <Standard Pack Size>"is displayed
  if item has not a predefined standard quantity for order then message "Order any quantity"is displayed
  A table with different quantities (multiples of the Standard pack) and the unit price for that quantity must be displayed.

  An input quantity field, an add button and a stock availability icon must be displayed.
  Rules:
  -Input field is displayed only if displayed only if ATTR_BUYABLE="yes"
  -Add to cart button is displayed only if displayed only if ATTR_BUYABLE="yes"
  -Input field must accept only integers
  -If ATTR_ALLIANCE_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -If ATTR_MOSS_PPA = "No", then the Quantity can only be in the multiples of the Standard Pack Quantity, else Quantity can be any integer number < 999 999 999
  -The default value should be the Lowest Standard Pack
  -If the quantity is not a multiple of the Standard pack (when it is required) an error message should be displayed
  -Error messages for input quantity will be displayed in red color, below the input

  Stock availability icon is present on all SKU details pages and it is queried from a Stock Cache
  Rules:
  -If stock > 0 then - icon = (Green)
  -If stock = 0 the - icon=(Amber)
  -Hovering on the Stock availability icon will display a tooltip 150px wide and with dynamic height

  @regression
  Scenario: Each SKU details page contains descriptive attributes that are displayed correctly
    Given the actor is on a SKU details page S
    Then the SKU descriptive attributes are displayed
    And the label column size is half of the description column size
    And the value column size is half of the description column size


  Scenario: The size of the component must adjust if the space the attributes take is larger than the default size of the component
    Given the actor is on a SKU details page S
    And the the number of attributes is large enough that exceeds in size the default component size
    Then the size of the component increases
    And all attributes are displayed


  Scenario: If length of label or value exceeds half of the description column size then the attribute label is wrapped.
    Given the actor is on a SKU details page S
    And the label column size exceeds half of the description column size
    And the value column size exceeds half of the description column size
    Then the text on the label column is wrapped
    And the text on the value column is wrapped


  Scenario: Quantity and unit price is displayed on all SKU items
    Given the actor is on a SKU details page S
    Then Quantity and Unit Prince section is displayed
    And a table containing unit price for different packages is displayed

  Scenario: "Buy in Multiples of <Standard Pack Size>" message is displayed when ATTR_MOSS_PPA / ATTR_MOSS_PPA is set to "yes"
    Given the actor is on a SKU details page which has ATTR_MOSS_PPA / ATTR_MOSS_PPA set to "yes" in the provided STEP configuration
    Then a "Buy in Multiples of <Standard Pack Size>" message is displayed

  Scenario: "Order any quantity" message is displayed when ATTR_MOSS_PPA / ATTR_MOSS_PPA is set to "no" in the Provided STEP configuration
    Given the actor is on a SKU details page which has ATTR_MOSS_PPA / ATTR_MOSS_PPA set to "no" in the provided STEP configuration
    Then an "Order any quantity" message is displayed


  Scenario: "Buy in Multiples of <Standard Pack Size>" message is displayed when ATTR_MOSS_PPA / ATTR_MOSS_PPA is set to "yes"
    Given the actor is on a SKU details page which has ATTR_MOSS_PPA / ATTR_MOSS_PPA set to "yes" in the provided STEP configuration
    Then a "Buy in Multiples of <Standard Pack Size>" message is displayed

  Scenario: "Order any quantity" message is displayed when ATTR_MOSS_PPA / ATTR_MOSS_PPA is set to "no" in the Provided STEP configuration
    Given the actor is on a SKU details page which has ATTR_MOSS_PPA / ATTR_MOSS_PPA set to "no" in the provided STEP configuration
    Then an "Order any quantity" message is displayed

  Scenario: "Unfortunately Pricing Information is not available. Please call our Customer Service Team @ 0845 ### ####" message is displayed when there is no pricing information in BPCS.
    Given the actor is on a SKU details page which does not have pricing information in BPCS
    Then "Unfortunately Pricing Information is not available. Please call our Customer Service Team @ 0845 ### ####" is displayed

  Scenario: The input quantity field and Add to cart button are not displayed
    Given the actor is on a SKU details page S
    And for the SKU ATTR_BUYABLE="no"
    Then input quantity field and Add to cart button are not displayed


  Scenario: The input quantity field default value is the Lowest Standard Pack
    Given the actor is on a SKU details page XS
    Then the default value in the input quantity field is the Lowest Standard Pack

  Scenario: The input field must accept only integers
    Given the actor is on a SKU details page XS
    And for the SKU ATTR_BUYABLE="yes"
    When the actor inputs non integer values
    Then an error message will be displayed
    And the error text will be red

  Scenario: When the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA is set to “No” then the user can only input multiples of the Standard Pack
    Given the actor is on a SKU details page XS
    And for the SKU ATTR_BUYABLE="yes"
    And the ATTR_ALLIANCE_PPA or ATTR_MOSS_PPA is set to No
    When the user inputs a number which is not a multiple of the Standard pack
    Then an error message is displayed



