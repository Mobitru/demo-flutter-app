package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

public class OrdersScreen extends BaseHomeScreen {

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'Completed')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Completed')]")
    private WebElement completedOrdersTitle;


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'In') or contains(@name,'Com')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Com') or contains(@content-desc,'In')]")
    private WebElement screenTitle;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'Order')]")
    @AndroidFindBy(xpath = "//android.widget.ImageView[string-length(@content-desc)>0]")
    private List<WebElement> orderMainElements;

    public String getFirstOrderGroupTitle() {
        return getContent(completedOrdersTitle);
    }

    public String getScreenTitle() {
        return getContent(screenTitle);
    }

    public List<String> getOrderMainElements() {
        return orderMainElements.stream().map(this::getContent).collect(Collectors.toList());
    }


    public OrdersScreen(AppiumDriver driver) {
        super(driver);
    }
}
