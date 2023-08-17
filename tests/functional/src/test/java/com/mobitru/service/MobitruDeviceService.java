package com.mobitru.service;

import com.mobitru.conf.GlobalConfig;
import io.restassured.RestAssured;
import org.aeonbits.owner.ConfigCache;

import java.io.File;
import java.util.List;

import static java.net.HttpURLConnection.HTTP_CREATED;
import static java.net.HttpURLConnection.HTTP_OK;

public class MobitruDeviceService {


    private static final String NATIVE_DEMO_FILE_ALIAS = "demo_automation_app";
    private final GlobalConfig config;

    public MobitruDeviceService() {
        this.config = ConfigCache.getOrCreate(GlobalConfig.class);
    }

    public void takeDeviceById(String udid) {
        RestAssured.
                given().
                baseUri(config.apiUrl()).
                auth().oauth2(config.apiKey()).
                when().
                post("device/{serial}", udid).then().
                statusCode(HTTP_OK);
    }

    public void installAppOnDevice(String udid, String fileId) {
        RestAssured.
                given().
                baseUri(config.apiUrl()).
                auth().oauth2(config.apiKey()).
                when().
                get("storage/install/{serial}/{fileId}/", udid, fileId).then().
                statusCode(HTTP_CREATED);
    }

    public String uploadAppIfNotPresent(File app) {
        List<String> uploadedArtifacts = RestAssured.
                given().
                baseUri(config.apiUrl()).
                auth().oauth2(config.apiKey()).
                when().
                get("v1/spaces/artifacts").
                then().
                extract().jsonPath().
                getList(String.format("findAll { it.alias=='%s' }.id", NATIVE_DEMO_FILE_ALIAS + app.getName()));
        if (uploadedArtifacts.isEmpty()) {
            return uploadApp(app);
        } else {
            return uploadedArtifacts.get(0);
        }
    }

    private String uploadApp(File app) {
        return RestAssured.given().auth().
                oauth2(config.apiKey()).
                baseUri(config.apiUrl()).
                header("X-Content-Type", "application/zip").
                header("x-File-Name", app.getName()).
                header("X-Alias", NATIVE_DEMO_FILE_ALIAS + app.getName()).
                contentType("multipart/form-data").
                multiPart("file", app).
                post("v1/spaces/artifacts").then().
                statusCode(HTTP_OK).extract().jsonPath().
                getString("id");
    }

}
