Feature: The Title and Description section must contain: SKU Title, Item Code and Item Description.
  Rules:
  -Text is wrapped when Item Title or Item Description text exceeds the size available for the content block.
  -Text is truncated when the Description length exceeds the maximum character count

  @regression
  Scenario: Scenario: The following information is visible in the title section of the SKU page: Full title, Item Code and Item description.
    Given the actor is on a SKU details page XS
    Then the SKU title, item code and item description is displayed

  Scenario: In the cases title or description length exceeds the size available in the content block the text is wrapped
    Given the actor is on a SKU details page XS
    And the Title exceeds the size available in the Content Block
    And the Description exceeds the size available in the Content Block
    Then the Title text is wrapped
    And the Description text is wrapped
