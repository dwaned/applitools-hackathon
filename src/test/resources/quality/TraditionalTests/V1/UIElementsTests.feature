@TraditionalTest
@UIElements
@V1
Feature: UI Elements Tests V1

  Scenario: Verify elements in Login page

    When I open website "{v1Url}"

    #Top Logo
    Then element is displayed by Attribute "class" Value "logo-w"

    #Login Form header
    And text "Login Form" is displayed in XPATH "//h4[@class='auth-header']"
    And element is displayed by xpath "//h4[@class='auth-header']"

    #Username field
    And text "Username" is displayed in XPATH "//*[@class='auth-wrapper']//form//label[.='Username']"
    And element is displayed by xpath "//*[@class='auth-wrapper']//form//label[.='Username']"
    And element is displayed by xpath "//input[@id='username']"
    And element is displayed by xpath "//*[contains(@class,'os-icon-user-male-circle')]"

    #Password field
    And text "Password" is displayed in XPATH "//*[@class='auth-wrapper']//form//label[.='Password']"
    And element is displayed by xpath "//*[@class='auth-wrapper']//form//label[.='Password']"
    And element is displayed by xpath "//input[@id='password']"
    And element is displayed by xpath "//*[contains(@class,'os-icon-fingerprint')]"

    #Login submit and remember me check
    And element is displayed by xpath "//button[@id='log-in']"
    And element is displayed by xpath "//input[@class='form-check-input']"
    And text "Remember Me" is displayed in XPATH "//label[@class='form-check-label']"
    And I check that all buttons using XPATH: "//*[@type='checkbox']" are clickable

    #Social media footer
    And element is displayed by xpath "//img[@src='img/social-icons/twitter.png']"
    And element is displayed by xpath "//img[@src='img/social-icons/facebook.png']"
    And element is displayed by xpath "//img[@src='img/social-icons/linkedin.png']"