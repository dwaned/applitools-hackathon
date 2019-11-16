@Applitools
@DataDrivenApplitools
Feature: Data Driven Tests for Login submission

  Background: Set up Applitools
    Given I open AppliTools

  Scenario Outline: Verify positive Login scenarios using Applitools
    Given I open website "{demoUrl}"
    When I type "<username>" into Attribute "id" Value "username"
    And I type "<password>" into Attribute "id" Value "password"
    And I click element with Attribute "id" and Value "log-in"
    Then I check screenshot with applitools with tagname "PositiveLoginTest"
    And I close AppliTools and handle results

    Examples:
      | username                 | password                              |
      | thisisquitealongusername | youwillneverknowmysupersecretpassword |
      | a                        | b                                     |

  Scenario: Verify correct error when both username and password are left blank using Applitools
    Given I open website "{demoUrl}"
    And I click element with Attribute "id" and Value "log-in"
    Then I check screenshot with applitools with tagname "BlankCredentialsTest"
    And I close AppliTools and handle results

  Scenario: Verify correct error when username is left blank using Applitools
    Given I open website "{demoUrl}"
    And I type "pass" into Attribute "id" Value "password"
    And I click element with Attribute "id" and Value "log-in"
    Then I check screenshot with applitools with tagname "BlankUsernameTest"
    And I close AppliTools and handle results

  Scenario: Verify correct error when password is left blank using Applitools
    Given I open website "{demoUrl}"
    When I type "user" into Attribute "id" Value "username"
    And I click element with Attribute "id" and Value "log-in"
    Then I check screenshot with applitools with tagname "BlankPasswordTest"
    And I close AppliTools and handle results
