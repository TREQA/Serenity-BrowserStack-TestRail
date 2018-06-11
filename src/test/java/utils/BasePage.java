package utils;

import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

/**
 * Created by dgurau on 08-Feb-18.
 */
public class BasePage extends PageObject {

    public WebDriver driver;

    public BasePage(WebDriver passedDriver){
        this.driver = passedDriver;
    }

    public void scrollPageDown250 () {
        JavascriptExecutor jse = (JavascriptExecutor)driver;
        jse.executeScript("scrollBy(0,250);");
    }

    public String getCurrentURL () {
        return driver.getCurrentUrl();
    }

    public void clearAllCookies () {
        driver.manage().deleteAllCookies();
    }
}