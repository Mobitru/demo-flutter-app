package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public abstract class BaseScreen {

    protected static final String CONTENT_DESC_ATTRIBUTE = "content-desc";
    private static final String NAME_ATTRIBUTE = "name";
    protected final AppiumDriver driver;

    public BaseScreen(AppiumDriver driver) {
        this.driver = driver;
        PageFactory.initElements(new AppiumFieldDecorator(driver), this);
    }


    protected void waitForElementDisplayed(WebElement element) {
        new WebDriverWait(driver, Duration.ofSeconds(10), Duration.ofSeconds(1)).ignoring(WebDriverException.class).
                until(ExpectedConditions.visibilityOf(element));
    }

    protected void waitForElementWithContentDisplayed(WebElement element, String text) {
        new WebDriverWait(driver, Duration.ofSeconds(10), Duration.ofSeconds(1)).ignoring(WebDriverException.class).
                until(ExpectedConditions.and(ExpectedConditions.visibilityOf(element),
                        ExpectedConditions.attributeContains(element, getContentAttributeName(), text)));
    }

    protected String getContent(WebElement element){
        return element.getAttribute(getContentAttributeName());
    }

    private String getContentAttributeName() {
        return driver.getCapabilities().getPlatformName().equals(Platform.ANDROID) ?
                CONTENT_DESC_ATTRIBUTE : NAME_ATTRIBUTE;
    }

}
