package steps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import pages.Sample_Page;

/**
 * Created by azainea on 23.05.2018.
 */
public class Sample_Steps {
    
    Sample_Page sample_page;

    @Given("^the user is on the Google page$")
    public void theUserIsOnTheGooglePage() {
        sample_page.open();
    }

    @When("^anything is searched$")
    public void anythingIsSearched() {
        sample_page.sendKeysToSearchBar("search");
        sample_page.clickSearchButton();

    }

    @Then("^results are shown$")
    public void resultsAreShown() {
        Assert.assertTrue(sample_page.firstResultIsDisplayed());
    }
}
