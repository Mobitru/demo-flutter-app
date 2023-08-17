package com.mobitru.screen;

import io.appium.java_client.AppiumDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.iOSXCUITFindBy;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.stream.Collectors;

public class ReviewOrderScreen extends BaseScreen {


    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[@name='Back']")
    @AndroidFindBy(xpath = "//*[@content-desc='My cart']/preceding-sibling::android.widget.Button")
    private WebElement returnBackButton;

    @iOSXCUITFindBy(xpath = "//*[@name='Contact details']/following-sibling::XCUIElementTypeStaticText[1]")
    @AndroidFindBy(xpath = "//*[@content-desc='Contact details']/following-sibling::android.view.View[1]")
    private WebElement nameText;

    @iOSXCUITFindBy(xpath = "//*[@name='Contact details']/following-sibling::XCUIElementTypeStaticText[2]")
    @AndroidFindBy(xpath = "//*[@content-desc='Contact details']/following-sibling::android.view.View[2]")
    private WebElement emailText;

    @iOSXCUITFindBy(xpath = "//*[@name='Contact details']/following-sibling::XCUIElementTypeStaticText[3]")
    @AndroidFindBy(xpath = "//*[@content-desc='Contact details']/following-sibling::android.view.View[3]")
    private WebElement addressText;

    @iOSXCUITFindBy(xpath = "//*[@name='Packaging fee']/following-sibling::XCUIElementTypeStaticText")
    @AndroidFindBy(xpath = "//*[@content-desc='Packaging fee']/following-sibling::android.view.View")
    private WebElement packageFeeValueText;


    @iOSXCUITFindBy(xpath = "//*[@name='Subtotal']/following-sibling::XCUIElementTypeStaticText")
    @AndroidFindBy(xpath = "//*[@content-desc='Subtotal']/following-sibling::android.view.View")
    private WebElement subTotalValueText;

    @iOSXCUITFindBy(xpath = "//*[@name='Delivery fee']/following-sibling::XCUIElementTypeStaticText")
    @AndroidFindBy(xpath = "//*[@content-desc='Delivery fee']/following-sibling::android.view.View")
    private WebElement deliveryFeeValueText;

    @iOSXCUITFindBy(xpath = "//*[@name='Discount']/following-sibling::XCUIElementTypeStaticText")
    @AndroidFindBy(xpath = "//*[@content-desc='Discount']/following-sibling::android.view.View")
    private WebElement discountValueText;

    @iOSXCUITFindBy(xpath = "//*[@name='Total']/following-sibling::XCUIElementTypeStaticText")
    @AndroidFindBy(xpath = "//*[@content-desc='Total']/following-sibling::android.view.View")
    private WebElement totalValueText;

    @iOSXCUITFindBy(xpath = "//XCUIElementTypeButton[contains(@name,'Confirm & place order')]")
    @AndroidFindBy(xpath = "//*[@content-desc='Confirm & place order']")
    private WebElement confirmButton;


    @iOSXCUITFindBy(xpath = "//*[@name='productImage']")
    @AndroidFindBy(xpath = "//*[@content-desc='productImage']")
    private List<WebElement> productImages;


    @iOSXCUITFindBy(xpath = "//*[@name='productImage']/following-sibling::XCUIElementTypeStaticText[1]")
    @AndroidFindBy(xpath = "//*[@content-desc='productImage']/following-sibling::android.view.View[1]")
    private List<WebElement> productTitles;


    @iOSXCUITFindBy(xpath = "//*[@name='productImage']/following-sibling::XCUIElementTypeStaticText[2]")
    @AndroidFindBy(xpath = "//*[@content-desc='productImage']/following-sibling::android.view.View[2]")
    private List<WebElement> productPrices;


    public OrderCompleteScreen confirmOrder() {
        confirmButton.click();
        return new OrderCompleteScreen(driver);
    }

    public List<String> getProductTitles() {
        return productTitles.stream().map(this::getContent).collect(Collectors.toList());
    }

    public List<String> getProductPrices() {
        return productPrices.stream().map(this::getContent).
                collect(Collectors.toList());
    }

    public String getName() {
        return getContent(nameText);
    }

    public String getEmail() {
        return getContent(emailText);
    }

    public String getAddress() {
        return getContent(addressText);
    }


    public String getPackageFee() {
        return getContent(packageFeeValueText);
    }

    public String getSubtotalValue() {
        return getContent(subTotalValueText);
    }


    public ReviewOrderScreen(AppiumDriver driver) {
        super(driver);
    }
}
