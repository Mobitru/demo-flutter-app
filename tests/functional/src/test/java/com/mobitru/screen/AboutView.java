package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

public class AboutView extends BaseScreen {


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Back']")
    @AndroidFindBy(xpath = "//*[@content-desc='About the app']/preceding-sibling::android.widget.Button")
    private WebElement backButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeWebView//XCUIElementTypeStaticText[contains(@name,'mob')]")
    @AndroidFindBy(xpath = "//android.webkit.WebView[@focusable='true']")
    private WebElement webView;

    public AboutView(AppiumDriver driver) {
        super(driver);
    }

    public String getWebViewTextAndReturnBack() {
        try {
            waitForElementDisplayed(webView);
            return webView.getText();
        } finally {
            backButton.click();
        }
    }


}
