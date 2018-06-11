Feature: A Header, footer and Change UOM components must be present on any SKU page with the defined characteristics.
  Rules:
  -Imperial and Metric Systems are available
  -If actor has no previous visits the default option is selected
  -When changed all measured values are displayed in the selected UOM

  Rules:
  -Imperial and Metric Systems are available
  -If actor has no previous visits the default option is selected
  -When changed all measured values are displayed in the selected UOM
  @regression
  Scenario: The Header component is present at the top of any SKU details page
    Given the actor is on a SKU details page S
    Then a Header component is displayed

  @regression
  Scenario: The Footer component is present on SKU details page
    Given the actor is on a SKU details page S
    Then a Footer component is displayed


  Scenario: The eSpot Area component is not configured
    Given the actor is on a SKU details page which does not have the Merchandising Area configured
    Then the Merchandising Area is not displayed

  Scenario: The Merchandising Area is configured
    Given the actor is on a SKU details page which has the Merchandising Area configured
    Then the Merchandising Area is displayed

  @regression
  Scenario: Change Unit of Measure should be present on any SKU details page
    Given the actor is on a SKU details page S
    Then Change unit of measure option is present


  Scenario: Selecting Metric will display all values in the Metric system
    Given the actor is on a SKU details page S
#    And the selected UOM is Imperial
    When he clicks on the metric button
    Then all measurement values should be changed Metric



  Scenario: Selecting Imperial will display all values in the Imperial system
    Given the actor is on a SKU details page S
#    And the selected UOM is Metric
    When he clicks on the imperial button
    Then all measurement values should be changed to Imperial
