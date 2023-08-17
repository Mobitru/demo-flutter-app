package com.mobitru.screen;

import com.google.common.base.CharMatcher;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

public class BaseHomeScreen extends BaseScreen {


    @iOSXCUITFindBy(xpath = "//*[contains(@name,'Home')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Home')]")
    private WebElement homeNavIcon;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'Orders')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Orders')]")
    private WebElement ordersNavIcon;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'Account')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Account')]")
    private WebElement accountNavIcon;


    @iOSXCUITFindBy(xpath = "//*[contains(@name,'the cart')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'the cart')]")
    private WebElement cartTitle;


    public BaseHomeScreen(AppiumDriver driver) {
        super(driver);
    }


    public String getCartTitle() {
        return getContent(cartTitle);
    }

    public CartScreen openCartScreen() {
        cartTitle.click();
        return new CartScreen(driver);
    }

    public Integer getAddedToCartProductsNumber() {
        return Integer.valueOf(CharMatcher.forPredicate(Character::isDigit).
                retainFrom(getCartTitle()));
    }

    public MyAccountScreen openMyAccount() {
        accountNavIcon.click();
        return new MyAccountScreen(driver);
    }

    public OrdersScreen openOrdersScreen() {
        ordersNavIcon.click();
        return new OrdersScreen(driver);
    }

    public ProductsListScreen openHome() {
        homeNavIcon.click();
        ProductsListScreen returnValue = new ProductsListScreen(driver);
        returnValue.waitForCartTitle();
        return returnValue;
    }


    public BaseHomeScreen waitForCartTitle() {
        waitForElementDisplayed(cartTitle);
        return this;
    }
}
