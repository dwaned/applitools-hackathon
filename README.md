# Applitools Hackathon Challenge

### Tools

To complete this challenge I have decided to make use of an open-source framework called [Dtective](http://dtective.io) for which I have contributed to. 
This framework is basically a Maven project with Selenium Webdriver (Java) and Cucumber that provides generic step definitions for browser interactions and API testing.

Since I am using Cucumber, I have structured the solution in this way:

### Traditional Tests
Location - src/test/resources/quality/TraditionalTests
    
    Tests:
    1. UIElementsTests.feature
    2. DataDrivenTests.feature
    3. TabSortTests.feature
    4. CanvasChartTests.feature
    5. DynamicContentTests.feature

In this location you will find two folders, V1 and V2, with the tests pointing at the respective URLs.
V2 contains the same set of tests including any possible changes required for V2 of the demo site.

### Visual AI Tests
Location - src/test/resources/quality/VisualAITests
    
    Tests:
    1. UIElementsTests.feature
    2. DataDrivenTests.feature
    3. TabSortTests.feature
    4. CanvasChartTests.feature
    5. DynamicContentTests.feature

### Custom Steps

The definitions of custom steps can be found in:
    - src/main/java/quality
    
    1. AppliToolsSteps.java
    2. CustomSteps.java

### Configuration

This framework provides some configuration options in which can be found in:
    
    - build/environment/environment.properties
    - build/environment/testEnvironment.json

The important properties for this challenge here are:

    - AppliToolsAPIKey - Containing the Applitools API key
    - AppliToolsBatchInfo - Setting the batch name
    - TestEnvironment - Setting the environment configuration to be used for URLs. The value must correspond to a key in
                        testEnvironment.json. This will allow you to make use of the keys within the JSON object by using placeholders.
                        Have a look at one of the test files and you will see {v1Url}, {v2Url} and {demoUrl}
    - SeleniumHubUrl - The URL to the Selenium Hub when running tests with `IsRemoteInstance=true`
                 
As with normal Maven projects, the above properties can be passed in command line (ex: -DTestEnvironment=env-demo)                
                        
## How-to

#### Local run
To be able to run locally, you will need to download chromedriver and place it in root of repository.
You will also need to have Maven installed.

To run the tests:

##### Traditional Tests V1
```
mvn compile test "-Dcucumber.options=--tags @V1" -DTestEnvironment=env-demo
```


##### Traditional Tests V2
```
mvn compile test "-Dcucumber.options=--tags @V2" -DTestEnvironment=env-demo
```

##### Visual AI Tests V1
```
mvn compile test "-Dcucumber.options=--tags @Applitools" -DTestEnvironment=env-v1
```

##### Visual AI Tests V2
```
mvn compile test "-Dcucumber.options=--tags @Applitools" -DTestEnvironment=env-v2
```


#### Remote (Selenium Standalone Hub)
The project provides a docker-compose file which can be used to set up a Selenium standalone hub with Chrome

To use it, you need docker installed. Then, in root of project you can run:
```
docker-compose -f docker-compose.selenium.yml up -d --build
```

Then you need to set the property `IsRemoteInstance` to `true` either in the file `environment.properties`
 or within the command like execution using `-DIsRemoteInstance=true`. You can then use the same commands as the above.
 
 #### Test Report
 
 You can also view an Allure Report by running `mvn site` after a test run. 
 The report can be found in `target/site/allure-maven-plugin/index.html`.
 
 #### CI
 *Bonus* : Since I took this challenge mostly as a fun and learning experience, I also invested some time to look at 
 Github Actions.
 With each push to this repository, a workflow named CI is running the Visual AI tests against the V2 site and posting 
 them with the Applitools Batch name CI.

___
 
 Than you for organizing this Challenge!
  