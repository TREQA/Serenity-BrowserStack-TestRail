Feature: Filter Facets which are configured in STEP are displayed on the Product Group pages at all time
  Rules:

  If the value range of a SKU attribute is 6 or less individual values for the Product Group, do not display Search bar and scroll bar
  If the value range of a SKU attribute is between 7 and 12 individual values do not display Search bar but displaye a scroll bar
  If the value range of a SKU attribute is more than 12 display Search bar and scroll bar

  @regression
  Scenario: Filter Facets are always displayed on Product Group pages
    Given the actor is on a Product group page Screw
    Then filter facets which are configure in STEP for the Product Group are displayed


  Scenario: Search bar and Scroll bar are not displayed if the facet has 6 or less individual values
    Given the actor is on a Product group page Screw
    And that page has a Facet with 6 or less individual values
    Then no search bar is displayed
    And no scroll bar is displayed

  Scenario: Search bar is not present but scroll bar is if the facet has between 7 and 12 individual values
    Given the actor is on a Product group page Screw
    And that page has a Facet which has between 7 and 12 individual values
    Then no search bar is displayed
    And scroll bar is displayed

  @regression
  Scenario: Search bar and scroll bar are displayed if a Facet has more than 12 individual values
    Given the actor is on a Product group page Screw
#    And that page has a Facet which has over 12 individual values
    Then a search bar is displayed
#    And a scroll bar is displayed