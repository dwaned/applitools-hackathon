package quality;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.dtective.quality.bddtests.webdriver.click.WebdriverClickSteps;
import io.dtective.quality.bddtests.webdriver.sendkeys.WebdriverSendkeysSteps;
import io.dtective.selenium.Extensions.QAWebElement;
import io.dtective.test.SeleniumCore;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;

public class CustomSteps {
    private WebdriverSendkeysSteps webdriverSendkeysSteps = new WebdriverSendkeysSteps();
    private WebdriverClickSteps webdriverClickSteps = new WebdriverClickSteps();
    private String[][] transactions;
    private int rowCount;
    private int columnCount;

    @Given("I log in the ACME demo site")
    public void iLogInTheACMEDemoSite() {
        webdriverSendkeysSteps.sendKeys("test", "id", "username");
        webdriverSendkeysSteps.sendKeys("test", "id", "password");

        webdriverClickSteps.iClickElementWithAttributeAndValue("id", "log-in");
    }

    @When("I sort by Amounts")
    public void iSortByAmounts() {
        webdriverClickSteps.iClickElementWithAttributeAndValue("id", "amount");
    }

    @And("I store current data")
    public void iStoreCurrentData() {
        rowCount = SeleniumCore.getWebDriver().findElements(By.xpath("//table[@id='transactionsTable']/tbody/tr")).size();
        columnCount = SeleniumCore.getWebDriver().findElements(By.xpath("//table[@id='transactionsTable']/thead/tr/th")).size();

        transactions = extractTransactions(rowCount, columnCount);
    }

    @Then("Amounts are sorted")
    public void amountsAreSorted() {
        Double current;
        Double previous = 0.00;
        String text;

        for (int i = 0; i < rowCount; i++) {
            text = SeleniumCore.getWebDriver().findElement(By.xpath(String.format("//table[@id='transactionsTable']/tbody/tr[%s]//td[%s]", i + 1, columnCount))).getText();
            current = Double.parseDouble(text.replace("USD", "").replace(",", "").replace(" ", "").trim());
            if (i != 0) {
                Assert.assertTrue("Sorting is incorrect", previous < current);
            }
            previous = current;
        }
    }

    @And("data integrity is kept")
    public void dataIntegrityIsKept() {
        String[][] sortedTransactions = extractTransactions(rowCount, columnCount);

        String desc;
        String sortedDesc = "";
        int index;

        for (int x = 0; x < rowCount; x++) {
            desc = transactions[x][2];
            index = 0;

            while (!desc.equals(sortedDesc) && index != rowCount) {
                sortedDesc = sortedTransactions[index][2];
                index++;
            }

            Assert.assertEquals(transactions[x][0], sortedTransactions[index - 1][0]);
            Assert.assertEquals(transactions[x][1], sortedTransactions[index - 1][1]);
            Assert.assertEquals(transactions[x][3], sortedTransactions[index - 1][3]);
            Assert.assertEquals(transactions[x][4], sortedTransactions[index - 1][4]);
        }
    }

    @Then("the chart data should be correct")
    public void theChartDataShouldBeCorrect() {
        QAWebElement element = SeleniumCore.getWebDriver().findElement(By.xpath("//div[@class='layout-w']//script"));
        String htmlCode = (String) ((JavascriptExecutor) SeleniumCore.getWebDriver()).executeScript("return arguments[0].innerHTML;", element);
        String values2017 = cleanData(htmlCode.substring(htmlCode.indexOf("label: '2017'"), htmlCode.indexOf("}")));
        String values2018 = cleanData(htmlCode.substring(htmlCode.indexOf("label: '2018'"), htmlCode.indexOf("}]")));

        Assert.assertTrue("Values for 2017 are incorrect", values2017.contains("10,20,30,40,50,60,70"));
        Assert.assertTrue("Values for 2018 are incorrect", values2018.contains("8,9,-10,10,40,60,40"));
    }

    @Then("I check new dataset")
    public void iCheckNewDataset() {
        /*
        This is not possible since the data is not available from the script tag and is dynamically generated after
        the call to Add dataset.
         */
        throw new PendingException();
    }

    private String[][] extractTransactions(int rowCount, int columnCount) {
        String[][] transactions = new String[rowCount][columnCount];

        for (int i = 0; i < rowCount; i++)
            for (int j = 0; j < columnCount; j++)
                transactions[i][j] = SeleniumCore.getWebDriver().findElement(By.xpath(String.format("//table[@id='transactionsTable']/tbody/tr[%s]//td[%s]", i + 1, j + 1))).getText();

        return transactions;
    }

    private String cleanData(String text) {
        return text
                .trim()
                .replace("\t", "")
                .replace("\n", "")
                .replace(" ", "");
    }
}
