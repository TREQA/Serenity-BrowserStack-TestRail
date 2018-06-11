Feature: Available options buttons should be displayed for each SKU
  Rules:
  -Order sample button - displayed only if sample is allowed (ATTR_SAMPLE = 1)
  -Request CAD button - displayed only if a CAD file is available for the SKU (ATTR_CAD_AVAILABLE = 1)
  -Request Quote button - always displayed
  -Technical Specs button - displayed only if there is one or more technical specification documents available (ASSET_REFERENCE_INFO_SHEET and/or ASSET_REFERENCE_COMPLIANCE_CERT are set)
  -Options column is 180px width
  -Action buttons will be 150x60px
  -Icons within buttons will be 40x40px

  Technical specifications are displayed as a list when the Technical Specs button is used.
  Rules:
  -List of technical specification must contain reference files which are configured in STEP
  -Any file from the list must be downloadable
  -More details need to be provided


  Scenario: A tool-tip is displayed when hovering over the icon
    Given the actor is on a SKU details page S
    When the actor hovers the courser over the icon
    Then a tool-tip text is displayed

  @regression
  Scenario: Icon is green when the status is “In Stock”
    Given the actor is on a SKU details page S
    And the availability of the SKU is “In Stock”
    Then Availability icon is green

  @regression
  Scenario: Icon is amber when the SKU availability is “In Production”
    Given the actor is on a SKU details page L
    And the availability of the SKU is “In Production”
    Then Availability icon is amber

  @pregression
  Scenario: All action buttons are 150x60px while the icons within the buttons are 40x40px
    Given the actor is on a SKU details page S
    Then all available Options buttons are visible
    And all Option buttons are 150x40px
    And all icons within the buttons are 12x12px

  Scenario: Order sample button is displayed only if ATTR_SAMPLE is set to 1
    Given the actor is on a SKU details page S
    And the SKU has the ATTR_SAMPLE set to 1
    Then the Order sample button is displayed

  Scenario: Request CAD button is displayed only if a CAD file is available for the SKU
    Given the actor is on a SKU details page S
    And a CAD file is available for the SKU
    Then the Request CAD button is displayed

  Scenario: Technical Specs button is displayed only if there is one or more technical specification documents available
    Given the actor is on a SKU details page S
    And the SKU has or more technical documents available
    Then the Technical Specs button is displayed

  @regression
  Scenario: Request quote button is displayed on all SKU details pages
    Given the actor is on a SKU details page S
    Then the Request Quote button is displayed

  @regression
  Scenario: Technical specifications list containing reference files is displayed when the Technical Specs button is used.
    Given the actor is on a SKU details page S
    When the Technical Specs button is clicked
    Then Technical specifications list is displayed
    And reference files are displayed


  Scenario: Any file from the list can be downloaded
    Given the actor is on a SKU details page XS
    And the Technical Specs list has been opened
    When the user selects any reference file
    Then a download button is displayed
#    And reference file is downloaded when used


