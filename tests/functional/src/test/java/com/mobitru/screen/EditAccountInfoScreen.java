package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.time.Duration;
import java.util.List;
import java.util.stream.Collectors;

public class EditAccountInfoScreen extends BaseScreen {

    private static final String VALUE_ATTRIBUTE = "value";
    private static final String CLICKABLE_ATTRIBUTE = "clickable";
    private static final String ACCESSIBLE_ATTRIBUTE = "accessible";
    @iOSXCUITFindBy(xpath = "//*[@name='Back']")
    @AndroidFindBy(xpath = "//*[@content-desc='Edit account']/preceding-sibling::android.widget.Button")
    private WebElement backButton;


    @iOSXCUITFindBy(xpath = "//*[@name='First name']/following-sibling::XCUIElementTypeTextField")
    @AndroidFindBy(xpath = "//*[@content-desc='First name']/following-sibling::android.widget.EditText")
    private WebElement firstNameInput;

    @iOSXCUITFindBy(xpath = "//*[@name='Last name']/following-sibling::XCUIElementTypeTextField")
    @AndroidFindBy(xpath = "//*[@content-desc='Last name']/following-sibling::android.widget.EditText")
    private WebElement lastNameInput;

    @iOSXCUITFindBy(xpath = "//*[@name='Email']/preceding-sibling::XCUIElementTypeOther")
    @AndroidFindBy(xpath = "//*[@content-desc='Email']/following-sibling::android.view.View")
    private WebElement emailInput;

    @iOSXCUITFindBy(xpath = "//*[@name='Address']/following-sibling::XCUIElementTypeTextField")
    @AndroidFindBy(xpath = "//*[@content-desc='Address']/following-sibling::android.widget.EditText")
    private WebElement addressInput;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeTextField/following-sibling::*[contains(@name,'Field')]")
    @AndroidFindBy(xpath = "//android.widget.EditText//android.view.View[contains(@content-desc, 'Field')]")
    private List<WebElement> inputErrors;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Save']")
    @AndroidFindBy(xpath = "//*[@content-desc='Save']")
    private WebElement saveButton;

    public EditAccountInfoScreen(AppiumDriver driver) {
        super(driver);
    }

    public boolean isEmailInputClickable() {
        return BooleanUtils.toBoolean(emailInput.getAttribute(getClickableAttributeName()));
    }

    private String getClickableAttributeName() {
        return driver.getCapabilities().getPlatformName().equals(Platform.ANDROID) ?
                CLICKABLE_ATTRIBUTE : ACCESSIBLE_ATTRIBUTE;
    }


    public List<String> enterDetailsAndGetErrorsText(String firstName, String lastName, String address) {
        enterDetailsAndPerformSave(firstName, lastName, address);
        return inputErrors.stream().map(this::getContent).collect(Collectors.toList());
    }

    public MyAccountScreen enterDetails(String firstName, String lastName, String address) {
        enterDetailsAndPerformSave(firstName, lastName, address);
        return new MyAccountScreen(driver);
    }

    public MyAccountScreen returnBack() {
        backButton.click();
        return new MyAccountScreen(driver);
    }

    private EditAccountInfoScreen enterDetailsAndPerformSave(String firstName, String lastName, String address) {
        firstNameInput.click();
        firstNameInput.clear();
        firstNameInput.sendKeys(firstName);
        lastNameInput.click();
        lastNameInput.clear();
        lastNameInput.sendKeys(lastName);
        addressInput.click();
        new FluentWait<>(addressInput)
                .withTimeout(Duration.ofMinutes(1))
                .pollingEvery(Duration.ofSeconds(3))
                .until(input -> {
                    input.clear();
                    return StringUtils.isEmpty(input.getAttribute(getContentAttributeName()));
                });
        address = StringUtils.defaultIfBlank(address + "\n", StringUtils.EMPTY);
        addressInput.sendKeys(address);
        saveButton.click();
        return this;
    }

    private String getContentAttributeName() {
        return driver.getCapabilities().getPlatformName().equals(Platform.ANDROID) ?
                CONTENT_DESC_ATTRIBUTE : VALUE_ATTRIBUTE;
    }

}
