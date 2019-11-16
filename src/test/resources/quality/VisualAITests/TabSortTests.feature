@Applitools
@TabSortApplitools
Feature: Tab Sort Tests

  Background: Set up Applitools
    Given I open AppliTools

  Scenario: Verify that sorting by Amounts keeps data intact using Applitools
    And I open website "{demoUrl}"
    And I log in the ACME demo site
    Then I check screenshot with applitools with tagname "TabSortTest"
    When I sort by Amounts
    Then I check screenshot with applitools with tagname "TabSortTest"
    And I close AppliTools and handle results