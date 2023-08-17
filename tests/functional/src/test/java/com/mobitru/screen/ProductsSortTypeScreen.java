package com.mobitru.screen;

import com.mobitru.enums.SortingTypes;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class ProductsSortTypeScreen extends BaseScreen {


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Back']")
    @AndroidFindBy(xpath = "//*[@content-desc='Sort by']/preceding-sibling::android.widget.Button")
    private WebElement backButton;


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Apply']")
    @AndroidFindBy(xpath = "//*[@content-desc='Apply']")
    private WebElement applyButton;

    private final static String SORTING_ITEM_XPATH_PATTERN = "//*[contains(@content-desc,'%1$s') or (contains(@name, '%1$s') and @accessible='true')]";

    public ProductsSortTypeScreen(AppiumDriver driver) {
        super(driver);
    }


    public ProductsListScreen applySorting(SortingTypes sortingTypes) {
        return selectSortingAndClick(sortingTypes, applyButton);
    }

    private ProductsListScreen selectSortingAndClick(SortingTypes sortingTypes, WebElement button) {
        By locator = By.xpath(String.format(SORTING_ITEM_XPATH_PATTERN, sortingTypes.getTitle()));
        driver.findElement(locator).click();
        button.click();
        return new ProductsListScreen(driver);
    }


}
