package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;


public class MyAccountScreen extends BaseHomeScreen {


    @iOSXCUITFindBy(xpath = "//*[contains(@name,'My')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'My')]")
    private WebElement screenTitle;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton/preceding-sibling::XCUIElementTypeStaticText[@index=2]")
    @AndroidFindBy(xpath = "//android.view.View[string-length(@content-desc)>0][@index=1]")
    private WebElement name;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'@')]")
    @AndroidFindBy(xpath = "//android.view.View[string-length(@content-desc)>0][2]")
    private WebElement email;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[@index=5]")
    @AndroidFindBy(xpath = "//android.view.View[string-length(@content-desc)>0][3]")
    private WebElement address;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@index=4]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'user')]/following-sibling::android.widget.Button")
    private WebElement editButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'About')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'About the app')]")
    private WebElement aboutText;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Logout']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Logout')]")
    private WebElement logoutButton;

    public MyAccountScreen(AppiumDriver driver) {
        super(driver);
    }


    public String getName() {
        return getContent(name);
    }

    public String getEmail() {
        return getContent(email);
    }

    public String getAddress() {
        return getContent(address);
    }

    public boolean isEditUserInfoButtonDisplayed() {
        return editButton.isDisplayed();
    }

    public boolean isLogoutButtonDisplayed() {
        return logoutButton.isDisplayed();
    }

    public String getScreenTitleText() {
        return getContent(screenTitle);
    }

    public EditAccountInfoScreen startEditMyAccountInfo() {
        waitForElementDisplayed(editButton);
        editButton.click();
        return new EditAccountInfoScreen(driver);
    }

    public AboutView openAboutView() {
        aboutText.click();
        return new AboutView(driver);
    }
}
