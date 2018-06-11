Feature: A Header, footer and Change UOM components must be present on any SKU page with the defined characteristics.
  Rules:
  -Imperial and Metric Systems are available
  -If actor has no previous visits the default option is selected
  -When changed all measured values are displayed in the selected UOM

  Rules:
  -Imperial and Metric Systems are available
  -If actor has no previous visits the default option is selected
  -When changed all measured values are displayed in the selected UOM

  Scenario: The Header component is present at the top of any SKU details page
    Given the actor is on a SKU details page
    Then a Header component is displayed


  Scenario: The Footer component is present on SKU details page
    Given the actor is on a SKU details page
    Then a Footer component is displayed


  Scenario: The eSpot Area component is not configured
    Given the actor is on a SKU details page which does not have the Merchandising Area configured
    Then the Merchandising Area is not displayed

  Scenario: The Merchandising Area is configured
    Given the actor is on a SKU details page which has the Merchandising Area configured
    Then the Merchandising Area is displayed


  Scenario: Change Unit of Measure should be present on any SKU details page
    Given the actor is on a SKU details page
    Then Change unit of measure option is present

  Scenario: The change made by the user should propagate throughout the page.
    Given the actor is on a SKU details page
    When he clicks on the unselected Unit of Measure
    Then all measurement values should be changed to the selected unit of measure
