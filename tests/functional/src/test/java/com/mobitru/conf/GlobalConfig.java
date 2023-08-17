package com.mobitru.conf;

import org.aeonbits.owner.Config;

import java.io.File;

@Config.LoadPolicy(Config.LoadType.MERGE)
@Config.Sources({"system:properties",
        "system:env"})
public interface GlobalConfig extends Config {

    @Key("project.name")
    @DefaultValue("personal")
    String projectName();

    @Key("api.key")
    String apiKey();

    @Key("api.url")
    @DefaultValue("https://${appium.hub.hostname}/billing/unit/${project.name}/automation/api")
    String apiUrl();

    @Key("appium.hub.hostname")
    @DefaultValue("app.mobitru.com")
    String appiumHubHostname();

    @Key("appium.hub.local.url")
    @DefaultValue("http://localhost:4723/")
    String appiumLocalHubUrl();

    @Key("platform.version")
    String platformVersion();

    @Key("platform.name")
    String platformName();

    @Key("device.name")
    String deviceName();

    @Key("device.udid")
    String deviceUdid();

    @Key("app.file")
    File app();


}
