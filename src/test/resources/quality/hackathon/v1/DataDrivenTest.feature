@datadriven
Feature: Data Driven Tests for Login submission

  Scenario Outline: Verify positive scenarios
    Given I open website "https://demo.applitools.com/hackathon.html"
    And I add the following data-store "username" "<username>"
    And I add the following data-store "password" "<password>"
    And I add the following data-store "input" "/html//input[@id='username']"
    When I type "{username}" into xpath "/html//input[@id='username']"
    And I type "{password}" into Attribute "id" Value "password"
    And I click submit with Attribute "id" and Value "log-in"
    Then element is displayed by xpath "//*[@class='logged-user-w']//*[@class='logged-user-i']"

    Examples:
      | username        | password       |
      | @Randomize(50)  | @Randomize(50) |
      | {@Randomize(1)} | {@Randomize(1) |
