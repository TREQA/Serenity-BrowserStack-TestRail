package pages;

import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import utils.BasePage;

/**
 * Created by azainea on 23.05.2018.
 */

@DefaultUrl("https://www.google.com/")
public class Sample_Page extends BasePage {
    public Sample_Page (WebDriver passedDriver) {super(passedDriver);}

    @FindBy (css = "#hplogo")
    private WebElement googleLogo;

    @FindBy (css = "#lst-ib")
    private WebElement searchBar;

    @FindBy (css = "[name=\"btnK\"")
    private WebElement searchButton;

    @FindBy (css = "#rso > div.bkWMgd > div.srg > div.g")
    private WebElement firstResult;


    public void sendKeysToSearchBar (String text) {
        searchBar.sendKeys(text);
    }

    public void clickSearchButton () {
        googleLogo.click();
        searchButton.click();
    }

    public boolean firstResultIsDisplayed () {
        return firstResult.isDisplayed();
    }
}
