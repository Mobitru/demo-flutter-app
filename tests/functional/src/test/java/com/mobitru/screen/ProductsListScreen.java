package com.mobitru.screen;

import com.google.common.base.CharMatcher;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

public class ProductsListScreen extends BaseHomeScreen {


    @iOSXCUITFindBy(xpath = "//*[@name='category']")
    @AndroidFindBy(xpath = "//*[@content-desc='category']")
    private WebElement categoryTitle;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'asc') or contains(@name, 'desc') or contains(@name,'A-Z') or contains(@name,'Z-A')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'asc') or contains(@content-desc, 'desc') or contains(@content-desc,'A-Z') or contains(@content-desc,'Z-A')]")
    private WebElement sortByTitle;


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Add to cart']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Add to cart')]")
    private List<WebElement> addToCartButtons;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Added to cart']")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'Added to cart')]")
    private List<WebElement> removedFromCartButtons;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeImage[contains(@name,'phone')]/following-sibling::XCUIElementTypeStaticText[contains(@name,'GB')]")
    @AndroidFindBy(xpath = "//android.widget.ImageView[contains(@content-desc,'phone')]/following-sibling::android.view.View[contains(@content-desc,'GB')]")
    private List<WebElement> productTitles;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'discount') and not(contains(@name,'price'))]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'discount') and not(contains(@content-desc,'price'))]")
    private List<WebElement> productDiscounts;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'discount') and contains(@name,'before')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'discount') and contains(@content-desc,'before')]")
    private List<WebElement> productOriginalPrices;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeImage[contains(@name,'phone')]")
    @AndroidFindBy(xpath = "//android.widget.ImageView[contains(@content-desc,'phone')]")
    private List<WebElement> productImages;

    @iOSXCUITFindBy(xpath = "//*[contains(@name,'discount') and contains(@name,'price')]")
    @AndroidFindBy(xpath = "//*[contains(@content-desc,'discount') and contains(@content-desc,'price')]")
    private List<WebElement> productPrices;


    public ProductsListScreen(AppiumDriver driver) {
        super(driver);
    }

    public ProductsSortTypeScreen openSortTypeScreen() {
        sortByTitle.click();
        return new ProductsSortTypeScreen(driver);
    }


    public List<String> getProductPrices() {
        return productPrices.stream().map(this::getContent).
                collect(Collectors.toList());
    }

    public List<Integer> getProductPricesAsInt() {
        return getTextsAsInt(getProductPrices());
    }

    public List<Integer> getOriginalProductPricesAsInt() {
        return getTextsAsInt(getProductOriginalPrices());
    }

    private List<Integer> getTextsAsInt(List<String> texts) {
        return texts.stream().
                map(price -> StringUtils.substringBefore(price, ".")).
                map(price -> CharMatcher.forPredicate(Character::isDigit).retainFrom(price)).
                map(Integer::parseInt).collect(Collectors.toList());
    }


    public List<String> getProductDiscounts() {
        return productDiscounts.stream().map(this::getContent).
                collect(Collectors.toList());
    }

    public List<Boolean> getProductImagesDisplayedState() {
        return productImages.stream().map(WebElement::isDisplayed).
                collect(Collectors.toList());
    }

    public List<String> getProductOriginalPrices() {
        return productOriginalPrices.stream().map(this::getContent).
                collect(Collectors.toList());
    }

    public List<String> getProductTitles() {
        return productTitles.stream().map(this::getContent).collect(Collectors.toList());
    }

    public ProductsListScreen addFirstProductToCart() {
        addProductToCart(1);
        return this;
    }

    public ProductsListScreen addProductToCart(int productNumber) {
        addToCartButtons.get(productNumber - 1).click();
        return this;
    }

    public ProductsListScreen removeFirstProductToCart() {
        removeProductFromCart(1);
        return this;
    }

    public ProductsListScreen removeProductFromCart(int productNumber) {
        WebElement element = removedFromCartButtons.get(productNumber - 1);
        waitForElementDisplayed(element);
        element.click();
        return this;
    }

    public ProductsListScreen waitForCategoryAppears() {
        waitForElementDisplayed(categoryTitle);
        return this;
    }

}
