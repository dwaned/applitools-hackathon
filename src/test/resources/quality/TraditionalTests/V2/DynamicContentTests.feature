@TraditionalTest
@DynamicContent
@V2
Feature: Dynamic Content Tests V2

  Scenario: Verify that ads are shown
    Given I open website "{v2Url}?showAd=true"
    When I log in the ACME demo site
    Then element is displayed by xpath "//img[@src='img/flashSale.gif']"
    And element is displayed by xpath "//img[@src='img/flashSale2.gif']"