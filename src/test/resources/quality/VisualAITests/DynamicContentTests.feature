@Applitools
@DynamicContentApplitools
Feature: Dynamic Content Tests

  Background: Set up Applitools
    Given I open AppliTools

  Scenario: Verify that ads are shown using Applitools
    Given I open website "{demoUrl}?showAd=true"
    When I log in the ACME demo site
    Then I check screenshot with applitools with tagname "DynamicContentTest"
    And I close AppliTools and handle results