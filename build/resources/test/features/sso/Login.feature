
Feature: In order to login into the local sites, the user will access the login button from the header component using an existing email address and the related password. If an user is registered on a local site, it shouldn't be able to login with the same credentials on another local site, unless it's register on that site with the same credentials


  Scenario: If the user added information is correct, the user will login in the local site
    Given the user is on the Login page
    When the the added information is correct
    Then the user will login in the local site


  Scenario: If the information are not correctly, the user will receive an error message
    Given the user is on the Login page
    When the added information is not correct
    Then the user will receive an error message

  Scenario: If an user is registered on a local site, it will not be able to login on another local site using the same credentials.
    Given the user is on a local the login page
    When the added information is correct but from another local site
    Then the user will receive an error message