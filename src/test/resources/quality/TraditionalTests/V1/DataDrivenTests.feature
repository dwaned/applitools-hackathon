@TraditionalTest
@DataDriven
@V1
Feature: Data Driven Tests for Login submission V1

  Scenario Outline: Verify positive Login scenarios
    Given I open website "{v1Url}"
    When I type "<username>" into Attribute "id" Value "username"
    And I type "<password>" into Attribute "id" Value "password"
    And I click element with Attribute "id" and Value "log-in"
    Then element is displayed by xpath "//*[@class='logged-user-w']//*[@class='logged-user-i']"

    Examples:
      | username                 | password                              |
      | thisisquitealongusername | youwillneverknowmysupersecretpassword |
      | a                        | b                                     |

  Scenario: Verify correct error when both username and password are left blank
    Given I open website "{v1Url}"
    And I click element with Attribute "id" and Value "log-in"
    Then text "Both Username and Password must be present " is displayed in XPATH "//*[@class='alert alert-warning']"

  Scenario: Verify correct error when username is left blank
    Given I open website "{v1Url}"
    And I type "pass" into Attribute "id" Value "password"
    And I click element with Attribute "id" and Value "log-in"
    Then text "Username must be present" is displayed in XPATH "//*[@class='alert alert-warning']"

  Scenario: Verify correct error when password is left blank
    Given I open website "{v1Url}"
    When I type "user" into Attribute "id" Value "username"
    And I click element with Attribute "id" and Value "log-in"
    Then text "Password must be present" is displayed in XPATH "//*[@class='alert alert-warning']"