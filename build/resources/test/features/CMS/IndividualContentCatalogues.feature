Feature: Content catalogs for Master Regional and Local sites must be created and should have the expected data entities:
  Catalogues:
  Master Site (EC)
  Regional Site (EC_AMERS)
  Regional Site (EC_EMEA)
  Local Site (EC_AMERS_CA)
  Local Site (EC_AMERS_US)
  Local Site (EC_EMEA_UK)
  Local Site (EC_EMEA_NL)

  Expected Data Entities:
  Catalogue ID
  Catalogue Name
  BU Code
  BU Description
  Region Code
  Country Code
  Domain Name
  Catalogue Type
  Parent Catalogue_ID
  Child Catalogue_ID list
  Language Context list
  Product Catalogue

  Scenario: A Master Site must be present in the Pages section of the CMS
    Given the user is on the CMS Pages section
    Then a Master EC Site is present


  Scenario: Two Regional sites EC_AMERS & EC_EMEA must be present in the Pages section of the CMS
    Given the user is on the CMS Pages section
    Then a Regional site for the AMERS region is present EC_AMERS
    And a Regional site for the EMEA region is present EC_EMEA

  Scenario: Two local sites must be present for the EC_AMERS region: EC_AMERS_CA & EC_AMERS_US
    Given the user is on the CMS Pages section
    Then a Local site for Canada is present EC_AMERS_CA
    And a Local site for US is present EC_AMERS_US

  Scenario: Two local sites must be present for the EC_EMEA region: EC_EMEA_UK & EC_EMEA_NL
    Given the user is on the CMS Pages section
    Then a Local site for UK is present EC_EMEA_UK
    And a Local site for Netherlands is present EC_EMEA_NL

  Scenario: The following Data entries must be present for all Content catalogues: Catalogue ID, Catalogue Name, BU Code, Region Code, Country Code, Domain Name, Catalogue Type, Language content List & Product Catalogue
    Given the user is on the CMS JCR section
    Then all catalogues have a Catalogue ID, Catalogue Name, BU Code, Region Code, Country Code, Domain name, Catalogue Type, Language Content List & Product Catalogue

  Scenario: The following Data entry must be present for Parent type catalogues: Child Catalogue_ID list
    Given the user is on the CMS JCR section
    Then Catalogues which are of type Parent must have the Child Catalogue_ID List data entry

  Scenario: The following Data entry must be present for Child type catalogues: Parent Catalogue_ID
    Given the user is on the CMS JCR section
    Then catalogues which are of type Child must have the Parent Catalogue_ID data entry