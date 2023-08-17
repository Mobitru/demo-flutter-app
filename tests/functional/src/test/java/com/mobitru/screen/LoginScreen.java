package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

public class LoginScreen extends BaseScreen {


    @iOSXCUITFindBy(xpath = "//*[starts-with(@name,'Login')]/following-sibling::XCUIElementTypeTextField")
    @AndroidFindBy(xpath = "//*[@content-desc='Login']/following-sibling::android.widget.EditText")
    private WebElement userNameInput;

    @iOSXCUITFindBy(xpath = "//*[starts-with(@name,'Password')]/following-sibling::XCUIElementTypeTextField")
    @AndroidFindBy(xpath = "//*[@content-desc='Password']/following-sibling::android.widget.EditText")
    private WebElement passwordInput;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[starts-with(@name,'Sign In')]")
    @AndroidFindBy(xpath = "//*[@content-desc='Sign In']")
    private WebElement signInButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[starts-with(@name,'errorMessage')]")
    @AndroidFindBy(xpath = "//*[@content-desc='errorMessage']")
    private WebElement errorTextLabel;


    public LoginScreen(AppiumDriver driver) {
        super(driver);
    }


    public LoginScreen enterCredentialsAndWaitError(String username, String password) {
        enterCredentialsAndSignIn(username, password);
        waitForElementDisplayed(errorTextLabel);
        return this;
    }

    public ProductsListScreen enterCredentials(String username, String password) {
        enterCredentialsAndSignIn(username, password);
        return new ProductsListScreen(driver);
    }

    private LoginScreen enterCredentialsAndSignIn(String username, String password) {
        //set focus
        userNameInput.click();
        userNameInput.clear();
        userNameInput.sendKeys(username);
        //set focus
        passwordInput.click();
        passwordInput.clear();
        passwordInput.sendKeys(password);
        signInButton.click();
        return this;
    }
}
