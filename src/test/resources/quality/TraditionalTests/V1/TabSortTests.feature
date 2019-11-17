@TraditionalTest
@TabSort
@V1
Feature: Tab Sort Tests V1

  Scenario: Verify that sorting by Amounts keeps data intact
    Given I open website "{v1Url}"
    And I log in the ACME demo site
    And I store current data
    When I sort by Amounts
    Then Amounts are sorted
    And data integrity is kept