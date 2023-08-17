package com.mobitru.tests;

import com.mobitru.conf.GlobalConfig;
import com.mobitru.enums.SortingTypes;
import com.mobitru.screen.*;
import com.mobitru.service.MobitruDeviceService;
import io.appium.java_client.AppiumDriver;
import io.appium.java_client.remote.options.BaseOptions;
import io.qameta.allure.Epic;
import io.qameta.allure.testng.AllureTestNg;
import org.aeonbits.owner.ConfigCache;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.api.SoftAssertions;
import org.openqa.selenium.MutableCapabilities;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.support.ui.FluentWait;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.testng.annotations.*;

import java.io.IOException;
import java.net.URL;
import java.time.Duration;
import java.util.Comparator;
import java.util.List;
import java.util.stream.IntStream;

import static java.lang.String.format;
import static java.time.Duration.ofSeconds;
import static org.apache.commons.lang3.StringUtils.EMPTY;
import static org.assertj.core.api.Assertions.assertThat;

@Epic("Smoke Native Tests")
@Listeners({AllureTestNg.class})
public class SmokeNativeTests {

    private static final String INVALID_LOGIN = "testuser@mobitru.com1";
    private static final String INVALID_PASSWORD = "password2";
    private static final String DEFAULT_LOGIN_ERROR = "Incorrect email or password";
    protected static final String VALID_LOGIN = "testuser@mobitru.com";
    protected static final String VALID_PASSWORD = "password1";

    protected static final String CORRECT_FN = "Edvard";
    protected static final String CORRECT_LN = "Grieg";
    protected static final String CORRECT_ADDRESS = "Oslo, Norway";
    private static final String FIELD_CANNOT_BE_EMPTY_TEXT = "Field can't be empty";

    private AppiumDriver driver = null;
    private final BaseOptions<? extends MutableCapabilities> options;
    private final Logger logger = LoggerFactory.getLogger(SmokeNativeTests.class);
    private LoginScreen loginScreen;
    private ProductsListScreen productsListScreen;
    private MyAccountScreen myAccountScreen;
    private CartScreen cartScreen;
    private ProductsSortTypeScreen sortTypeScreen;
    private EditAccountInfoScreen editAccountInfoScreen;
    private ReviewOrderScreen reviewOrderScreen;
    private final MobitruDeviceService deviceService = new MobitruDeviceService();
    private final GlobalConfig config;


    SmokeNativeTests(BaseOptions<? extends MutableCapabilities> options) {
        this.options = options;
        this.config = ConfigCache.getOrCreate(GlobalConfig.class);
    }


    @BeforeClass
    public void startDriver() throws IOException {
        URL connectionUrl;
        String deviceUdid = String.valueOf(options.getCapability("udid"));

        if (StringUtils.isNoneBlank(deviceUdid, config.apiKey())) {
            String fileId = deviceService.uploadAppIfNotPresent(config.app());
            deviceService.takeDeviceById(deviceUdid);
            deviceService.installAppOnDevice(deviceUdid, fileId);
            connectionUrl = new URL(format("https://%s:%s@%s/wd/hub",
                    config.projectName(), config.apiKey(), config.appiumHubHostname()));
        } else {
            options.setCapability("app", config.app().getAbsolutePath());
            connectionUrl = new URL(config.appiumLocalHubUrl());
        }

        FluentWait<URL> wait = new FluentWait<>(connectionUrl);
        logger.info("Attempt to start a Driver on the Device");
        driver = wait.withTimeout(Duration.ofMinutes(1)).
                pollingEvery(Duration.ofSeconds(5)).
                ignoring(WebDriverException.class).
                until(url -> new AppiumDriver(url, options));
        logger.info("The Driver successfully started");
        driver.manage().timeouts()
                .implicitlyWait(ofSeconds(4));
        loginScreen = new LoginScreen(driver);
        productsListScreen = new ProductsListScreen(driver);
    }

    @Test(description = "Check login with invalid credentials")
    public void loginInValidCredential() {
        loginScreen.enterCredentialsAndWaitError(INVALID_LOGIN, INVALID_PASSWORD);
    }

    @Test(description = "Check login with empty username")
    public void loginEmptyUsername() {
        loginScreen.enterCredentialsAndWaitError(EMPTY, VALID_PASSWORD);
    }

    @Test(description = "Check login with empty password")
    public void loginEmptyPassword() {
        loginScreen.enterCredentialsAndWaitError(VALID_LOGIN, EMPTY);
    }

    @Test(description = "Check login with empty password and username")
    public void loginEmptyPasswordAndUserName() {
        loginScreen.enterCredentialsAndWaitError(EMPTY, EMPTY);
    }


    @Test(description = "Check login with valid credentials", groups = "validLogin", priority = 1)
    public void loginValidCredential() {
        this.productsListScreen = loginScreen.enterCredentials(VALID_LOGIN, VALID_PASSWORD);
        productsListScreen.waitForCategoryAppears();
    }


    @Test(description = "Edit my account info with empty first name", groups = "editMyAccount", priority = 2)
    public void editMyAccountInfoEmptyFirstName() {
        List<String> errors = editAccountInfoScreen.enterDetailsAndGetErrorsText(EMPTY, CORRECT_LN, CORRECT_ADDRESS);
        assertThat(errors).hasSize(1).containsOnly(FIELD_CANNOT_BE_EMPTY_TEXT);
    }

    @Test(description = "Edit my account info with empty last name", groups = "editMyAccount", priority = 2)
    public void editMyAccountInfoEmptyLastName() {
        List<String> errors = editAccountInfoScreen.enterDetailsAndGetErrorsText(CORRECT_FN, EMPTY, CORRECT_ADDRESS);
        assertThat(errors).hasSize(1).containsOnly(FIELD_CANNOT_BE_EMPTY_TEXT);
    }

    @Test(description = "Edit my account info with empty address", groups = "editMyAccount", priority = 2)
    public void editMyAccountInfoEmptyAddressName() {
        List<String> errors = editAccountInfoScreen.enterDetailsAndGetErrorsText(CORRECT_FN, CORRECT_LN, EMPTY);
        assertThat(errors).hasSize(1).containsOnly(FIELD_CANNOT_BE_EMPTY_TEXT);
    }

    @Test(description = "Edit my account info with all empty fields", groups = "editMyAccount", priority = 2)
    public void editMyAccountInfoEmptyAll() {
        List<String> errors = editAccountInfoScreen.enterDetailsAndGetErrorsText(EMPTY, EMPTY, EMPTY);
        assertThat(errors).size().isGreaterThan(1).returnToIterable().containsOnly(FIELD_CANNOT_BE_EMPTY_TEXT);
    }

    @Test(description = "Edit my account info using correct values", groups = "editMyAccountValid", priority = 2)
    public void editMyAccountInfoUsingCorrectValues() {
        MyAccountScreen myAccountScreen = editAccountInfoScreen.enterDetails(CORRECT_FN, CORRECT_LN, CORRECT_ADDRESS);
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(myAccountScreen.getName()).contains(CORRECT_FN, CORRECT_LN);
            softly.assertThat(myAccountScreen.getAddress()).contains(CORRECT_ADDRESS);
        });
    }

    @Test(description = "Check cannot edit email address", groups = "editMyAccount", priority = 2)
    public void cannotEditEmail() {
        assertThat(editAccountInfoScreen.isEmailInputClickable()).isFalse();
    }


    @Test(description = "Check my account details exist", groups = "myAccount", priority = 2)
    public void checkMyAccountDetailsExist() {
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(myAccountScreen.getEmail()).isEqualTo(VALID_LOGIN);
            softly.assertThat(myAccountScreen.isEditUserInfoButtonDisplayed()).isTrue();
        });
    }

    @Test(description = "Check about view", groups = "myAccount", priority = 2)
    public void checkAboutView() {
        String webViewText = myAccountScreen.openAboutView().getWebViewTextAndReturnBack();
        assertThat(webViewText).containsIgnoringCase("mob");
    }

    @Test(description = "Check my account view", groups = "myAccount", priority = 2)
    public void checkMyAccountViewElement() {
        assertThat(myAccountScreen.getScreenTitleText()).isEqualTo("My account");
    }

    @Test(description = "Check my account logout exist", groups = "myAccount", priority = 2)
    public void checkLogoutElement() {
        assertThat(myAccountScreen.isLogoutButtonDisplayed()).isTrue();
    }


    @Test(description = "Check complete orders screen", priority = 2)
    public void checkCompletedOrdersList() {
        OrdersScreen completeScreen = productsListScreen.openOrdersScreen();
        assertThat(completeScreen.getFirstOrderGroupTitle()).isEqualTo("Completed (7)");
    }


    @Test(description = "Check add product to cart", groups = "productInCart", priority = 2)
    public void checkAddToCart() {
        assertThat(productsListScreen.getCartTitle()).isEqualTo(getCartTitle(1));
    }

    @Test(description = "Check add several products to cart", groups = "productInCart", priority = 4)
    public void checkAddSeveralProductsToCart() {
        productsListScreen.addFirstProductToCart();
        assertThat(productsListScreen.getCartTitle()).isEqualTo(getCartTitle(2));
    }

    @Test(description = "Check remove product from cart", groups = "productInCart", priority = 3)
    public void checkRemoveFromCart() {
        int numberBefore = productsListScreen.getAddedToCartProductsNumber();
        productsListScreen.removeFirstProductToCart();
        assertThat(productsListScreen.getAddedToCartProductsNumber()).isEqualTo(numberBefore - 1);
    }

    @Test(description = "Check open cart after add product", groups = "openCartWithProduct", priority = 3)
    public void checkOpenCartAfterAddProduct() {
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(cartScreen.isContinueToCheckoutButtonPresent()).isTrue();
            softly.assertThat(cartScreen.getProductMainElements()).isNotEmpty();
        });
    }

    @Test(enabled = true, description = "Check open cart after remove single product", groups = "openCartWithNoProduct", priority = 4)
    public void checkOpenCartAfterRemoveSingleProduct() {
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(cartScreen.isEmptyCartLabelDisplayed()).isTrue();
            softly.assertThat(cartScreen.isGoToProductsButtonDisplayed()).isTrue();

        });
    }

    @Test(description = "check products list screen", groups = "productsList", priority = 3)
    public void checkProductItemElements() {
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(productsListScreen.getProductTitles()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);
            softly.assertThat(productsListScreen.getProductDiscounts()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);
            softly.assertThat(productsListScreen.getProductPrices()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);
            softly.assertThat(productsListScreen.getProductOriginalPrices()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);
            softly.assertThat(productsListScreen.getProductImagesDisplayedState()).contains(true);
        });

    }

    @Test(description = "check sort price desc", groups = "changeSorting", priority = 5)
    public void checkSortPriceDescending() {
        sortTypeScreen.applySorting(SortingTypes.PRICE_DESC);
        assertThat(productsListScreen.getProductPricesAsInt()).
                isSortedAccordingTo(Comparator.reverseOrder());
    }

    @Test(description = "check sort price ask", groups = "changeSorting", priority = 6)
    public void checkSortPriceAscending() {
        sortTypeScreen.applySorting(SortingTypes.PRICE_ASC);
        assertThat(productsListScreen.getOriginalProductPricesAsInt()).
                isSortedAccordingTo(Comparator.naturalOrder());
    }

    @Test(description = "check sort name asc", groups = "changeSorting", priority = 5)
    public void checkSortNameAscending() {
        sortTypeScreen.applySorting(SortingTypes.NAME_ASC);
        assertThat(productsListScreen.getProductTitles()).
                isSortedAccordingTo(Comparator.naturalOrder());
    }

    @Test(description = "check sort name desc", groups = "changeSorting", priority = 5)
    public void checkSortNameDescending() {
        sortTypeScreen.applySorting(SortingTypes.NAME_DESC);
        assertThat(productsListScreen.getProductTitles()).
                isSortedAccordingTo(Comparator.reverseOrder());
    }


    @Test(description = "check information on review order screen", groups = "reviewOrderScreen", priority = 9)
    public void checkInfoOnReviewOrderScreen() {
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(reviewOrderScreen.getProductTitles()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);
            softly.assertThat(reviewOrderScreen.getProductPrices()).isNotEmpty().
                    allMatch(StringUtils::isNotBlank);

            softly.assertThat(reviewOrderScreen.getName()).contains(CORRECT_FN, CORRECT_LN);
            softly.assertThat(reviewOrderScreen.getAddress()).contains(CORRECT_ADDRESS);
            softly.assertThat(reviewOrderScreen.getEmail()).contains(VALID_LOGIN);

            softly.assertThat(reviewOrderScreen.getPackageFee()).isNotEmpty();
            softly.assertThat(reviewOrderScreen.getSubtotalValue()).isNotEmpty();

        });
    }


    @Test(description = "check complete order flow", groups = "reviewOrderScreen", priority = 7)
    public void completeOrder() {
        OrderCompleteScreen screen = reviewOrderScreen.confirmOrder();
        SoftAssertions.assertSoftly(softly -> {
            softly.assertThat(screen.getConfirmedOrdersLabelText()).contains("Order successfully placed. Please check you email");
            productsListScreen = screen.goBackToProductsList();
            softly.assertThat(productsListScreen.getCartTitle()).isEqualTo(getCartTitle(0));
            softly.assertThat(productsListScreen.getProductTitles()).isNotEmpty();
        });
    }

    @Test(description = "check completed order on orders screen", groups = "productsList", priority = 8)
    public void completedOrderCheck() {
        OrdersScreen completeScreen = productsListScreen.openOrdersScreen();
        assertThat(completeScreen.getScreenTitle()).isEqualToIgnoringCase("In Progress (1)");
    }


    @BeforeMethod(onlyForGroups = {"editMyAccount", "editMyAccountValid"})
    public void openEditMyAccount() {
        editAccountInfoScreen = productsListScreen.openMyAccount().startEditMyAccountInfo();
    }

    @BeforeMethod(onlyForGroups = {"myAccount"})
    public void openMyAccount() {
        myAccountScreen = productsListScreen.openMyAccount();
    }

    @BeforeMethod(onlyForGroups = {"productsList"})
    public void openProductsList() {
        productsListScreen = productsListScreen.openHome();
    }

    @BeforeMethod(onlyForGroups = {"productInCart"})
    public void addProductToCart() {
        openProductsList();
        if (productsListScreen.getAddedToCartProductsNumber() == 0) {
            productsListScreen.addFirstProductToCart();
        }
    }

    @BeforeMethod(onlyForGroups = {"reviewOrderScreen"})
    public void openReviewOrderScreen() {
        openCartScreenWithProduct();
        reviewOrderScreen = cartScreen.processToCheckout();
    }

    @BeforeMethod(onlyForGroups = {"changeSorting"})
    public void openChangeSortView() {
        openProductsList();
        sortTypeScreen = productsListScreen.openSortTypeScreen();
    }

    @BeforeMethod(onlyForGroups = {"openCartWithProduct"})
    public void openCartScreenWithProduct() {
        addProductToCart();
        cartScreen = productsListScreen.openCartScreen();
    }

    @BeforeMethod(onlyForGroups = {"openCartWithNoProduct"})
    public void openCartScreenWithNoProduct() {
        if (productsListScreen.getAddedToCartProductsNumber() > 0) {
            IntStream.range(0, productsListScreen.getAddedToCartProductsNumber()).
                    forEach(index -> productsListScreen.removeFirstProductToCart());
        }
        cartScreen = productsListScreen.openCartScreen();
    }

    @AfterMethod(onlyForGroups = {"openCartWithProduct", "openCartWithNoProduct"})
    public void returnBackFromCart() {
        productsListScreen = cartScreen.returnBack();
    }

    @AfterMethod(onlyForGroups = "editMyAccount")
    public void returnBackFromEdit() {
        editAccountInfoScreen.returnBack();
    }


    private String getCartTitle(int count) {
        return String.format("%d items in the cart", count);
    }


    @AfterClass
    public void quitDriver() {
        driver.quit();
    }

}
