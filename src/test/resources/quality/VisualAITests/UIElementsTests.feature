@Applitools
@UIElementsApplitools
Feature: UI Elements Tests

  Background: Set up Applitools
    Given I open AppliTools

  Scenario: Verify elements in Login page using Applitools
    When I open website "{demoUrl}"
    And I check screenshot with applitools with tagname "UITest"
    Then I close AppliTools and handle results