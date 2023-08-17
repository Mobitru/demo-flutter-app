package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

public class CartScreen extends BaseScreen {

    @iOSXCUITFindBy(xpath = "//*[@name='Back']")
    @AndroidFindBy(xpath = "//*[starts-with(@content-desc,'My')]/preceding-sibling::android.widget.Button")
    private WebElement returnBackButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Apply promo code']")
    @AndroidFindBy(xpath = "//*[starts-with(@content-desc,'Apply promo code')]")
    private WebElement applyPromoButton;

    @iOSXCUITFindBy(xpath = "//*[@name='plusButton']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'plusButton')]")
    private List<WebElement> addMoreProductButtons;

    @iOSXCUITFindBy(xpath = "//*[@name='minusButton']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'minusButton')]")
    private List<WebElement> reduceProductNumberButtons;

    @iOSXCUITFindBy(xpath = "//*[@name='removeButton']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'removeButton')]")
    private List<WebElement> removedFromCartButtons;


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Continue to checkout']")
    @AndroidFindBy(xpath = "//*[starts-with(@content-desc,'Continue to checkout')]")
    private WebElement continueToCheckoutButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeStaticText[contains(@name,'empty')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'empty')]")
    private WebElement emptyCartLabel;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='View products']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'View products')]")
    private WebElement goToProductsButton;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeImage[string-length(@name)>0]")
    @AndroidFindBy(xpath = "//android.widget.ImageView[string-length(@content-desc)>0]")
    private List<WebElement> productMainElements;


    public boolean isContinueToCheckoutButtonPresent() {
        return continueToCheckoutButton.isDisplayed();
    }

    public boolean isGoToProductsButtonDisplayed() {
        return goToProductsButton.isDisplayed();
    }

    public boolean isEmptyCartLabelDisplayed() {
        return emptyCartLabel.isDisplayed();
    }

    public List<String> getProductMainElements() {
        return productMainElements.stream().map(this::getContent).collect(Collectors.toList());
    }

    public ProductsListScreen returnBack() {
        returnBackButton.click();
        return new ProductsListScreen(driver);
    }

    public ReviewOrderScreen processToCheckout() {
        continueToCheckoutButton.click();
        return new ReviewOrderScreen(driver);
    }

    public CartScreen(AppiumDriver driver) {
        super(driver);
    }


}
