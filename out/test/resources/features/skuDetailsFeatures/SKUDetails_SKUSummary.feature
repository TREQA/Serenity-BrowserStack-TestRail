Feature: Each SKU details page must have an Image and thumbnails section
  Rules:

  PHOTO displayed in the Image section must be 140x140px Resolution.
  -Thumbnails PHOTOS must be 60x60px Resolution
  -Primary image is zoomable when clicked
  -Thumbnails will replace Image section when clicked
  -Zoomed Image resolution is 800x800px

  The Title and Description section must contain: SKU Title, Item Code and Item Description.
  Rules:
  -Text is wrapped when Item Title or Item Description text exceeds the size available for the content block.
  -Text is truncated when the Description length exceeds the maximum character count

  Each SKU details page must have a Print Page button
  Rules:
  -Print page button size is 124x40
  -Print page icon size is 36x36
  -When clicked, it must trigger the Browser's Print functionality (depending on browser and version). No reformatting of the Page is expected by the “Print Page” feature.

  Each SKU details page must have an eSpot Area displayed.
  Rules:
  -Component is displayed only if it is configured - Need more info in UAC

  Each SKU details page must have an eSpot Area displayed.
  Rules:
  -Component is displayed only if it is configured - Need more info in UAC

  Scenario: SKU image and thumbnails are visible on the SKU details page
    Given the actor is on a SKU details page
    Then the SKU primary image and thumbnails is displayed
    And the Primary image has a 140x140px resolution
    And the SKU thumbnails are a 60x60px resolution

  Scenario: SKU thumbnail images are limited on displaying 3 thumbnail per page and display a scroll bar if the SKU has more than 3 images
    Given the actor is on a SKU page with 3 or more thumbnail images present
    When the actor uses the navigation bar
    Then the thumbnails section scrolls and displays images previously not shown

  Scenario: SKU thumbnails are replacing the SKU image when clicked
    Given the actor is on a SKU details page
    When the actor clicks a thumbnail
    Then the image in the thumbnail replaces the primary image
    And the primary image becomes a thumbnail

  Scenario: Primary image has zoomed button when hovered.
    Given the actor is on a SKU details page
    When the actor hovers over the SKU image
    Then a zoom button appears on the SKU image

  Scenario: Primary image zooms to an 800x800px resolution in an Overlay when clicked.
    Given the actor is on a SKU details page
    When the actor clicks on the SKU primary image
    Then the image is zoomed to 800x800px resolution in a Overlay

  Scenario: If there is no primary image no thumbnails are displayed, and a blank container is displayed instead of the primary image
    Given the actor is on a SKU details page
    And there is no primary image
    Then no thumbnails are displayed
    And a blank container with default background is displayed


  Scenario: The following information is visible in the title section of the SKU page: Full title, Item Code and Item description.
    Given the actor is on a SKU details page
    Then the SKU title, item code and item description is displayed

  Scenario: In the cases title or description length exceeds the size available in the content block the text is wrapped
    Given the actor is on the SKU details page
    And the Title exceeds the size available in the Content Block
    And the Description exceeds the size available in the Content Block
    Then the Title text is wrapped
    And the Description text is wrapped

  Scenario: In the case the description length exceeds the maximum character count for that element the text should be truncated
    Given the actor is on the SKU details page
    And the Item Description text length exceeds the maximum characters configured for that element - 16000 chars
    Then the Item Description text is truncated

  Scenario: The print page button is present and has the correct resolution
    Given the actor is on a SKU details page
    Then Print page button is shown
    And Print page button has a 124x40 size
    And Print page icon has a 36x36 size

  Scenario: After clicking the print page button the browser print functionality must trigger. No reformatting should be triggered by the Print Page feature
    Given the actor is on a SKU details page
    And the user clicks on Print Page button
    Then browser print functionality is triggered
    And no reformatting for the page occurs

  Scenario: The eSpot Area component is not configured
    Given  the actor is on a SKU details page which does not have the eSpot Area configured
    Then the eSpot Area is not displayed

  Scenario: The eSpot Area is configured
    Given the actor is on a SKU details page which has the eSpot Area configured
    Then the eSpot Area is displayed

  Scenario: The eSpot Area component is not configured
    Given the actor is on a SKU details page which does not have the eSpot Area configured
    Then the eSpot Area is not displayed

  Scenario: The eSpot Area is configured
    Given the actor is on a SKU details page which has the eSpot Area configured
    Then the eSpot Area is displayed
