@TraditionalTest
@TabSort
@V2
Feature: Tab Sort Tests V2

  Scenario: Verify that sorting by Amounts keeps data intact
    Given I open website "{v2Url}"
    And I log in the ACME demo site
    And I store current data
    When I sort by Amounts
    Then Amounts are sorted
    And data integrity is kept