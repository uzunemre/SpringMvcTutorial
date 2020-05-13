package com.emreuzun.springmvc.enumaration;

public enum InfoEnum {

    NEW("New"),
    HOT("Hot");

    private String message;

    InfoEnum(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

}
