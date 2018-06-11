Feature: A hierarchy must be in place on the CMS tool in which multiple content catalogues (sites) are present and certain hierarchical relationships are created between the sites
  Rules:
  -Each site can be a Parent Site, Child Site, or Both
  -Centralized Repository/Library of Templates must be accessible to all Sites
  -Building the hierarchy will be a development activity and business will not have any ability to create/amend the hierarchy
  -Sharing content flow is always from Parent site to a Child site

  -The Site Hierarchy must be as follows:
  1. Master Site (EC) - Site Type (Parent) : Top of the Hierarchy
  2. Regional Site (EC_AMERS) - Site Type (Both)
  3. Regional Site (EC_EMEA) - Site Type (Both)
  4. Local Site (EC_AMERS_CA) - Site Type (Child)
  5. Local Site (EC_AMERS_US) - Site Type (Child)
  6. Local Site (EC_EMEA_UK) - Site Type (Child)
  7. Local Site (EC_EMEA_NL) - Site Type (Child)

  -Parent Site:
  Parent Sites can share content to their Child Sites and also can receive content from their Parent sites (if they exist)
  Parent Sites must be configured to NOT publish content to any of the Sites
  It must be possible to create Content Structure and Instances (Page Instance & Component Instance) using the Page Templates and Component Templates
  Parent Sites must support Multiple Languages

  -Child Site:
  Must not share content with any other site
  Must be configured to publish content to the Website
  It must be possible to create Content Structure and Instances (Page Instance & Component Instance) using the Page Templates and Component Templates
  Must support one or more languages - as configured in the Configuration File

  Scenario: A hierarchy of a Master, two regional and 4 local sites must be in place in the CMS admin tool.
    Given the user is on the CMS admin Pages section
    Then a hierarchy of Master - Regional - Local sites is present

  Scenario: The Master site (EC) must be only a Parent Site Type (Top of the Hierarchy)
    Given the user is on the CMS admin JCR section
    And the website category is selected
    When the Master site element is expanded to view its details
    Then the Site Type is set to “Parent”

  Scenario: The Regional EMEA site (EC-EMEA) and AMERS site (EC-AMERS) must have the Site Type set to Both
    Given the user is on the CMS JCR section
    When the EMEA Regional site element is expanded to view its details
    And the AMERS Regional site element is expanded to view its details
    Then the Site Type for both Regional sites is set to “Both”

  Scenario: All local sites must have the Site Type set to Child
    Given the user is on the CMS JCR section
    When the Local site elements are expanded
    Then the Site Type for all Local sites is set to Child

  Scenario: All Sites must be able to create Page and Component instances using the Page and Component Templates
    Given the user is on the CMS Pages section
    When he tries to create a new page or component using existing page or component templates
    Then a new page or component is created successfully

  Scenario: Parent Sites must support at least one language
    Given the user is on the CMS JCR section
    When a Parent site element is expanded
    Then there will be at least one entry for language

  Scenario: Child sites must support at least one language
    Given the user is on the CMS JCR section
    When a Child site element is expanded
    Then there will be at least one entry for language