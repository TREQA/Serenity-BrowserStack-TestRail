Feature: Filters are available for the SKU list on Product Group page
  Search field for each facet must have its scope restricted to the individual facet
  There must be no restrictions on what characters the actor can enter
  Upon entering a value the search must auto-trigger with the following rules:
  Only attribute values matching the characters must be filtered in the respective Facet.
  (ii) SKUs in the Table must be filtered to match the Facet attributes filtered in  above.
  (iii) Refresh other Facets on the page to match the SKU list in the Table.
  (iv) Repeat the Process if the search input is amended.
  (v) if 'No result' is found message to be displayed and SKU Table remains unchanged.
  When there is no Search bar displayed for a facet, the actor is able to select and/or unselect the values within the facet and the Resut Table must be refreshed to match the filters

  Scenario: Filters are displayed on a Product Group page next to the SKU details table
    Given the actor is on a Product group page Screw
    Then Filters are displayed next to the SKU details table

  @regression
  Scenario: Using the Search bar on a Facet must only influence the individual Facet
    Given the actor is on a Product group page Screw
    When values are input into the search bar of a facet
    Then the facet attributes are filtered
#    And filters from other facets remain unchanged

  Scenario: Any characters can be entered into the search bar
    Given the actor is on a Product Group page
    When entering any type of value into the Search Bar
    Then the search bar must accept the input

  Scenario: Search action must auto trigger at any input
    Given the actor is on a Product Group page
    When entering a value into the Search Bar
    Then attribute values matching the characters must be filtered

  Scenario: SKUs in the table are filtered to match the Facet attributes
    Given the actor is on a Product Group page
    When entering a value into the Search Bar
    Then the SKUs in the table are filtered to match the Facet attributes that are filtered

  Scenario: Attributes from other facets are filtered to match the SKU list in the table
    Given the actor is on a Product Group page
    When entering a value into the Search Bar
    Then the attributes in other facets are filtered to match the SKU list in the table

  Scenario: Process is repeated if the search input is amended
    Given the actor is on a Product Group page
    And a value has been entered into the Search Bar
    When the value is amended
    Then the attributes in the Facets are filtered
    And the SKUs in the table are filtered

  Scenario: SKU list in the table remains unchanged if 'No result' message is displayed
    Given the actor is on a Product Group page
    And a value has been entered in the Search Bar
    And a 'No result' message is displayed
    Then the SKU list remains unchanged

  Scenario: If no Search Bar is displayed for a Facet - Actor is able to select / Un-select (i.e. Filter) the values within the Facet and as a Result the SKU table must be refreshed to match the filters.
    Given the actor is on a Product Group page
    And a facet does not have a Search Bar
    When the actor selects/un-selects a value within that Facet
    Then the results in the SKU table are filtered