@TraditionalTest
@CanvasChart
@V2
Feature: Canvas Chart Tests V2
  
  Scenario: Verify that the chart data is correct before and after dataset is added
    Given I open website "{v2Url}"
    And I log in the ACME demo site
    When I click element with Attribute "id" and Value "showExpensesChart"
    Then the chart data should be correct
    And I click element with Attribute "id" and Value "addDataset"
    Then I check new dataset

