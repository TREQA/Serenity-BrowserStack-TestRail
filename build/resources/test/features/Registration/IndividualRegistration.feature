Feature: In order to register, the user must fill the following information:

  email address:
  a validation for “@” presence on the email address will be made
  ".domain" must be checked
  first name – must not be empty
  last name – must not be empty
  password – alphanumeric
  confirm password – must match the value from the password field
  If any of these are not filled with the correct information, display an error message that will show what information wasn't filled correctly.


  Scenario: If the user enters an email address with “@” character and ".domain", no error message is displayed and the next fields can be filled.
    Given the user is on the registration page
    And fills the email address field with a valid email address format
    Then no error message is displayed and the next fields can be filled


  Scenario: If the user enters a value in the first name field, no error message is displayed and the next fields can be filled.
    Given the user is on the registration page
    And the first name field is not empty
    Then no error message is displayed and the next fields can be filled


  Scenario: If the user enters a value in the last name field, no error message is displayed and the next fields can be filled.
    Given the user is on the registration page
    And the last name field is not empty
    Then no error message is displayed and the next fields can be filled


  Scenario: If the user enters an alphanumeric value in the password field, no error message is displayed and the next fields can be filled.
    Given the user is on the registration page
    And the password field is alphanumeric
    Then no error message is displayed and the next fields can be filled


  Scenario: If the user enters the same value in the confirm password field as in the password field, no error message is displayed.
    Given the user is on the registration page
    And the confirm password field has the same value as the password field
    Then no error message is displayed and the next fields can be filled


  Scenario: If the user fills all required fields correctly, no error message is displayed and registration can proceed.
    Given the user is on the registration page
    And all required fields have been completed correctly
    Then no error message is displayed and the registration process can proceed