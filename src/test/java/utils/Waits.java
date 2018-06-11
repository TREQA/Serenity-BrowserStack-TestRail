package utils;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Created by dgurau on 08-Feb-18.
 */
public class Waits {

    public static WebElement clickable(WebDriver driver, WebElement element) {
        return new WebDriverWait(driver,TestData.SHORT_WAIT).until(ExpectedConditions.elementToBeClickable(element));
    }

    public static WebElement visible(WebDriver driver, WebElement element) {
        return new WebDriverWait(driver,TestData.SHORT_WAIT).until(ExpectedConditions.visibilityOf(element));
    }
}
