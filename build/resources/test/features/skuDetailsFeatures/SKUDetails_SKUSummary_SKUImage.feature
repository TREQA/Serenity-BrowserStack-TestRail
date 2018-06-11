Feature: Each SKU details page must have an Image and thumbnails section
  Rules:

  PHOTO displayed in the Image section must be 140x140px Resolution.
  -Thumbnails PHOTOS must be 60x60px Resolution
  -Primary image is zoomable when clicked
  -Thumbnails will replace Image section when clicked
  -Zoomed Image resolution is 800x800px



  Each SKU details page must have an eSpot Area displayed.
  Rules:
  -Component is displayed only if it is configured - Need more info in UAC


  @regression
  Scenario: SKU image and thumbnails are visible on the SKU details page
    Given the actor is on a SKU details page XS
    Then the SKU primary image and thumbnails is displayed
#    And the Primary image has a 143x143px resolution
#    And the SKU thumbnails are a 56x56px resolution


  Scenario: SKU thumbnail images are limited on displaying 3 thumbnail per page and display a scroll bar if the SKU has more than 3 images
    Given the actor is on a SKU page with 3 or more thumbnail images present
    When the actor uses the directional arrows
    Then the thumbnails section scrolls and displays images previously not shown

  @regression
  Scenario: SKU thumbnails are replacing the SKU image when clicked
    Given the actor is on a SKU details page XS
    When the actor clicks a thumbnail
    Then the image in the thumbnail replaces the primary image

  Scenario: Primary image has zoomed button when hovered.
    Given the actor is on a SKU details page S
    When the actor hovers over the SKU image
    Then a zoom button appears on the SKU image

  @regression
  Scenario: Primary image zooms to an 800x800px resolution in an Overlay when clicked.
    Given the actor is on a SKU details page S
    When the actor clicks on the SKU primary image
    Then the image is zoomed to 700x700px resolution in a Overlay


  Scenario: If there is no primary image no thumbnails are displayed, and a blank container is displayed instead of the primary image
    Given the actor is on a SKU details page S
    And there is no primary image
    Then no thumbnails are displayed
    And a blank container with default background is displayed


