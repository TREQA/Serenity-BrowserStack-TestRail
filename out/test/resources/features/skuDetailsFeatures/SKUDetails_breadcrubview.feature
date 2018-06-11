Feature: Actors should be able to view their position in the page stack of the website by showing the menu hierarchy of the current page
  Rules:
  Breadcrumb view text is wrapped when the text exceeds the maximum length
  Correct path starting from the Home page is displayed
  Information follows attached wireframe

  Scenario: Breadcrumb view must be displayed on all sku details while and correct path is displayed
    Given the actor is on a SKU details page
    Then Breadcrumb view is displayed
    And Breadcrumb view shows the correct path of the page within the website with respect to the classification hierarchy

  Scenario: Breadcrumb view text is wrapped when the maximum length is exceeded
    Given the actor is on a SKU details page
    And the text of the breadcrumb view exceeds the maximum length
    Then the text of the breadcrumb view is wrapped
