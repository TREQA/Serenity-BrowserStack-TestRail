Feature: SKU details are expandable and contain additional information in the SKU summary list of any Product Group pages

  Scenario: When details for a SKU are expanded additional descriptive attributes are displayed in 'Attribute : Value' pairs
    Given the actor is on a Product group page Screw
    When details for a SKU are expanded
    Then additional descriptive attributes are displayed
    And the descriptive attributes follow the 'Attribute: Value' format

  Scenario: Only attributed with ATTR_ATTRIB_FACET_DISPLAY set to 'yes' are displayed
    Given the actor is on a Product group page Screw
    When details for a SKU are expanded
    Then only attributes with ATTR_ATTRIB_FACET_DISPLAY set to 'yes' in STEP are displayed

  @regression
  Scenario: A 'See more' button/linked text is displayed and it redirects the user to the SKU details page
    Given the actor is on a Product group page Screw
    When details for a SKU are expanded
    And 'See more' is clicked
    Then the actor is redirected to the SKU details page

  @regression
  Scenario: Request CAD is displayed for SKUs with ATTR_CAD_AVAILABLE set to '1'
    Given the actor is on a Product group page Screw
    And details for a SKU are expanded
#    And that SKU has ATTR_CAD_ATTRIBUTE set to 1
    Then Request CAD button is displayed

  @regression
  Scenario: Request Quote button is displayed for all SKUs
    Given the actor is on a Product group page Screw
    And a SKU details section is extended
    Then a Request Quote button is displayed

  Scenario: Technical Specs button is displayed if one or more technical specification documents are available
    Given the actor is on a Product group page Screw
    And a SKU details section is extend
    And that SKU has ASSET_REFERENCE_INFO_SHEET or/and ASSET_REFERENCE_COMPLIANCE_CERT set
    Then a Technical Specs button is displayed
