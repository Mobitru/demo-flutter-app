package com.mobitru.enums;


public enum SortingTypes {

    PRICE_ASC("Price ascending"),
    PRICE_DESC("Price descending"),
    NAME_ASC("Product name A"),
    NAME_DESC("Product name Z");

    private final String title;


    SortingTypes(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }
}
