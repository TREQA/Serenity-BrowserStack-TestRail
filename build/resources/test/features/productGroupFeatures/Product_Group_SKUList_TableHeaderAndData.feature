Feature: Each Product group page must have a list of SKU-s with displayed header
Rules:
-Header has static columns: Item code, Price range, Stock Availability and Product Facet Filter attributes
-Header has dynamic columns: a configured number of displayable attributes
- Considering X = configured maximum number of displayable attributes for product groups and Y = Number of Facet Filter attributes defined at Product Group Level in ATTR_CAT_FACET_SEQ1, ATTR_CAT_FACET_SEQ2, ... , ATTR_CAT_FACET_SEQ12 for PRODUCT ID, which are set (has values not null) and ATTR_ATTRIB_FACET_DISPLAY = 'Yes' for ITEMS grouped within PRODUCT ID
- if X >= Y then display as columns names of all Facet Filters, ordered by sequence in ATTR_CAT_FACET_SEQ
- if X < Y then display as columns top X names of displayable attributes, ordered by sequence in ATTR_CAT_FACET_SEQ
-Columns with displayable attributes have sort option available

  @regression
  Scenario: The header is displayed and has configured number of displayable attributes columns
    Given the actor is on a Product group page Screw
  #  And displayable attributes for Product from STEP>= configured number of columns for displayable attributes
    Then  Item code, Price range, Stock Availability and Product Facet Filter attributes column headers are displayed
  #  And seven displayable attributes column headers are displayed, containing attributes label

  Scenario: The header is displayed and has less than the configured number of displayable attributes columns
    Given the actor is on a Product group page Screw
    And displayable attributes for Product from STEP < configured number of columns for displayable attributes
    Then Item code, Price range, Stock Availability and Product Facet Filter attributes column headers are displayed
    And the number of displayable attributes column headers is displayed containing attributes label
