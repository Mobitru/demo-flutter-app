package com.mobitru.tests;

import com.mobitru.conf.GlobalConfig;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.ios.options.XCUITestOptions;
import io.appium.java_client.remote.AndroidMobileCapabilityType;
import io.appium.java_client.remote.MobilePlatform;
import io.appium.java_client.remote.options.BaseOptions;
import org.aeonbits.owner.ConfigCache;
import org.apache.commons.lang3.StringUtils;
import org.assertj.core.util.Arrays;
import org.openqa.selenium.MutableCapabilities;
import org.testng.annotations.Factory;

public class SmokeNativeTestsFactory {


    @Factory
    public Object[] generateAllTests() {
        GlobalConfig config = ConfigCache.getOrCreate(GlobalConfig.class);
        return Arrays.array(new SmokeNativeTests(generateOptions(config)));
    }

    private BaseOptions<? extends MutableCapabilities> generateOptions(GlobalConfig config) {
        BaseOptions<? extends MutableCapabilities> options = config.platformName().equalsIgnoreCase(MobilePlatform.ANDROID) ?
                new UiAutomator2Options() : new XCUITestOptions();
        if (config.platformName().equalsIgnoreCase(MobilePlatform.ANDROID)) {
            options.setCapability("appPackage", "com.epam.mobitru");
            options.setCapability("appActivity", "com.epam.mobitru.MainActivity");
            options.setCapability("noReset", true);
            options.setCapability(AndroidMobileCapabilityType.AUTO_GRANT_PERMISSIONS, true);
        } else {
            options.setCapability("bundleId", "com.epam.mobitru.demoapp");
            options.setCapability("autoAcceptAlerts", true);
        }

        if (StringUtils.isNotBlank(config.deviceUdid())) {
            options.setCapability("udid", config.deviceUdid());
        } else {
            options.setCapability("platformVersion", config.platformVersion());
            options.setCapability("deviceName", config.deviceName());
        }
        options.setCapability("unicodeKeyboard", true);
        options.setCapability("resetKeyboard", true);
        return options;
    }

}
