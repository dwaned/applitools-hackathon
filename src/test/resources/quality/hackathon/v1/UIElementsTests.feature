Feature: Test V1 app
  
  Scenario: Verify elements in Login page

    When I open website "https://demo.applitools.com/hackathon.html"

    #Top Logo
    Then element is displayed by Attribute "class" Value "logo-w"

    #Login Form header
    And element is displayed by xpath "/html/body[@class='auth-wrapper']//h4[@class='auth-header']"

    #Username field related
    And element is displayed by xpath "/html/body[@class='auth-wrapper']//form//label[.='Username']"
    And element is displayed by xpath "/html//input[@id='username']"
    And element is displayed by xpath "//*[contains(@class,'os-icon-user-male-circle')]"

    #Password field related
    And element is displayed by xpath "/html/body[@class='auth-wrapper']//form//label[.='Password']"
    And element is displayed by xpath "/html//input[@id='password']"
    And element is displayed by xpath "//*[contains(@class,'os-icon-fingerprint')]"

    #Login submit and remember me check
    And element is displayed by Attribute "class" Value "button#log-in"
    And element is displayed by Attribute "class" Value "form-check-label"
    #check that toggle is clickable

    #Social media footer
    And element is displayed by xpath "//form/div[@class='buttons-w']//img[@src='img/social-icons/twitter.png']"
    And element is displayed by xpath "//form/div[@class='buttons-w']//img[@src='img/social-icons/facebook.png']"
    And element is displayed by xpath "//form/div[@class='buttons-w']//img[@src='img/social-icons/linkedin.png']"