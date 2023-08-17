package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

public class OrderCompleteScreen extends BaseScreen {

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'placed')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'placed')]")
    private WebElement orderConfirmedLabel;


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[contains(@name,'Go back to products')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Go back to products')]")
    private WebElement goBackButton;


    public String getConfirmedOrdersLabelText() {
        return getContent(orderConfirmedLabel);
    }

    public ProductsListScreen goBackToProductsList() {
        goBackButton.click();
        return new ProductsListScreen(driver);
    }


    public OrderCompleteScreen(AppiumDriver driver) {
        super(driver);
    }
}
