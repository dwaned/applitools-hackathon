package quality;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {
                "src/test/resources/quality"
        },
        glue = {
                "src/test/java/quality",
                "quality",
                "classpath:io.dtective"
        }, plugin = {"io.qameta.allure.cucumber4jvm.AllureCucumber4Jvm"})
public class GlobalTestHookTest {
}