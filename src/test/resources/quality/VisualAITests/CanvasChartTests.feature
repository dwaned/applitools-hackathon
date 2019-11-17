@Applitools
@CanvasChartApplitools
Feature: Canvas Chart Tests

  Background: Set up Applitools
    Given I open AppliTools

  Scenario: Verify that the chart data is correct before and after dataset is added
    Given I open website "{demoUrl}"
    And I log in the ACME demo site
    When I click element with Attribute "id" and Value "showExpensesChart"
    Then I check screenshot with applitools with tagname "CanvasChartTest"
    And I click element with Attribute "id" and Value "addDataset"
    Then I check screenshot with applitools with tagname "CanvasChartTest"
    And I close AppliTools and handle results