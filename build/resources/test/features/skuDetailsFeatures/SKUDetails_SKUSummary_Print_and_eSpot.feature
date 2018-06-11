Feature: Each SKU details page must have a Print Page button
  Rules:
  -Print page button size is 124x40
  -Print page icon size is 36x36
  -When clicked, it must trigger the Browser's Print functionality (depending on browser and version). No reformatting of the Page is expected by the “Print Page” feature.

  Each SKU details page must have an eSpot Area displayed.
  Rules:
  -Component is displayed only if it is configured - Need more info in UAC

  @regression
  Scenario: The print page button is present and has the correct resolution
    Given the actor is on a SKU details page S
    Then Print page button is shown
    And Print page button has a 157x43 size
    And Print page icon has a 12x12 size

#  Cannot be AUTOMATED
  Scenario: After clicking the print page button the browser print functionality must trigger.
    Given the actor is on a SKU details page XS
    And the user clicks on Print Page button
    Then browser print functionality is triggered


  Scenario: The eSpot Area component is not configured
    Given  the actor is on a SKU details page which does not have the eSpot Area configured
    Then the eSpot Area is not displayed


  Scenario: The eSpot Area is configured
    Given the actor is on a SKU details page which has the eSpot Area configured
    Then the eSpot Area is displayed


