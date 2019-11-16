@TraditionalTest
@DynamicContent
@V1
Feature: Dynamic Content Tests

  Scenario: Verify that ads are shown
    Given I open website "{v1Url}?showAd=true"
    When I log in the ACME demo site
    Then I assert that the element is visible by XPATH "//img[@src='img/flashSale2.gif']" within 5 seconds
    And I assert that the element is visible by XPATH "//img[@src='img/flashSale.gif']" within 5 seconds