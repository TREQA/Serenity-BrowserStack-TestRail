

Feature: Each Product group page must have an Image and thumbnails section
  Rules:
  -Primary Image size must be 140x140x
  -Thumbnails size must be 60x60px
  -Primary image is zoomable when clicked
  -Thumbnails will replace Primary image when clicked
  -Zoomed resolution is 800x800px

  Rules:
  -Text is wrapped when Item Title or Item Description text exceeds the size available for the content block.
  -Text is truncated when the Description length exceeds the maximum character count

  Each Product group page can have a Technical specs icon (depending on the Product configuration)
  Rules:
  -Technical specification icon must follow the STEP configuration
  -Icon is 40x40 resolution
  -On hover tool-tip text is displayed in a 150px box

  Each Product group page must have a Print Page button
  Rules:
  -Print page button size is 124x40
  -Print page icon size is 36x36
  -When clicked, it must trigger the Browser's Print functionality (depending on browser and version). No reformatting of the Page is expected by the “Print Page” feature.

  Each Product group page must have an eSpot Area displayed.
  Rules:
  -Component is displayed only if it is configured - Need more info in UAC

  @regression
  Scenario: Product group image and thumbnails are visible on the Product group page
    Given the actor is on a Product group page Lift
    Then the Product group primary image and thumbnails is displayed
#    And the Primary image has a 143x143px size
#    And the thumbnails are a 56x56px size

  Scenario: Product Group thumbnail images are limited on displaying 3 thumbnail per page and display a scroll bar if the SKU has more than 3 images
    Given the actor is on a Product group page with 3 or more thumbnail images present
    When the actor uses the navigation bar
    Then the thumbnails section scrolls and displays images previously not shown

  Scenario: Product group thumbnails are replacing the Product group image when clicked
    Given the actor is on a Product group page
    When the actor clicks a thumbnail
    Then the image in the thumbnail replaces the primary image


  Scenario: Primary image has zoom button when hovered.
    Given the actor is on a Product group page
    When the actor hovers over the Product group image
    Then a zoom button appears on the Product Group image

  @regression
  Scenario: Primary image zooms to an 800x800x image when clicked.
    Given the actor is on a Product group page Lift
    When the actor clicks on the Product group primary image
    Then the image is zoomed

  Scenario: If there is no primary image no thumbnails are displayed, and a blank container is displayed instead of the primary image..
    Given the actor is on a Product group page
    And there is no primary image
    Then no thumbnails are displayed
    And a blank container with default background is displayed

  @regression
  Scenario: The following information is visible in the title section of the Product group page: Full title and Product group description.
    Given the actor is on a Product group page Lift
    Then the Product group title and Product group description are displayed

  Scenario: In the cases title or description length exceeds the size available in the content block the text is wrapped
    Given the actor is on a Product group page
    And the Title exceeds the size available in the Content Block
    And the Description exceeds the size available in the Content Block
    Then the Title text is wrapped
    And the Description text is wrapped

  Scenario: In the case the description length exceeds the maximum character count for that element the text should be truncated
    Given the actor is on a Product group page
    And the Product group Description text length exceeds the maximum characters configured for that element
    Then the Product group Description text is truncated


  Scenario: In the case the Product group has ATTR_HAS_INFO = 0 and ATTR_HAS_CERT = 0 in the STEP configuration.
    Given the actor is on a Product group page
    And for that Product group ATTR_HAS_INFO = 0 and ATTR_HAS_CERT = 0 in the provided STEP configuration
    Then the technical information icon is not displayed

  Scenario: In the case the Product group has ATTR_HAS_INFO = 1 and/or ATTR_HAS_CERT = 1 in the STEP configuration.
    Given the actor is on a Product group page
    And for that Product group ATTR_HAS_INFO = 1 and/or ATTR_HAS_CERT = 1 in the provided STEP configuration
    Then the technical information icon is displayed

  @regression
  Scenario: When hovering over tool tip buttons an informative text placed within a 150px wide box with dynamic content
    Given the actor is on a Product group page Lift
    And the actor hovers cursor over the toop-tip icon
    Then a tool-tip text is displayed in a box with a width of 150 px and dynamic height


  @regression
  Scenario: The print page button is present and has the correct resolution
    Given the actor is on a Product group page Lift
    Then Print page button is shown
    And Print page button has a 157x43 size
    And Print page icon has a 12x12 size

  Scenario: After clicking the print page button the browser print functionality must trigger. No reformatting should be triggered by the Print Page feature
    Given the actor is on a Product group page
    And the user clicks on Print Page button
    Then browser print functionality is triggered
    And no reformatting for the page occurs

  Scenario: The eSpot Area component is not configured
    Given the actor is on a Product group page which does not have the eSpot Area configured
    Then the eSpot Area is not displayed

  Scenario: The eSpot Area is configured
    Given the actor is on a Products group page which has the eSpot Area configured
    Then the eSpot Area is displayed
