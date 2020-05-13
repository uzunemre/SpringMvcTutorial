package com.emreuzun.springmvc.model;

import com.emreuzun.springmvc.enumaration.InfoEnum;
import com.emreuzun.springmvc.enumaration.SizeEnum;

import java.math.BigDecimal;
import java.util.Map;

public class Product {

    private Long id;

    private String name;

    private String description;

    private String imagePath;

    private InfoEnum infoEnum;

    private BigDecimal oldPrice = BigDecimal.ZERO;

    private BigDecimal price = BigDecimal.ZERO;

    private double averageStar;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public InfoEnum getInfoEnum() {
        return infoEnum;
    }

    public void setInfoEnum(InfoEnum infoEnum) {
        this.infoEnum = infoEnum;
    }

    public BigDecimal getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(BigDecimal oldPrice) {
        this.oldPrice = oldPrice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public double getAverageStar() {
        return averageStar;
    }

    public void setAverageStar(double averageStar) {
        this.averageStar = averageStar;
    }

    public String getPriceIntegerText() {
        return "$" + price.intValue();
    }

    public String getPriceDecimalText() {
        BigDecimal val = price.setScale(2);
        int length = val.toString().length();
        return "." + val.toString().substring(length - 2, length);
    }

    public boolean isHot() {
        if (infoEnum == null) {
            return false;
        }
        return infoEnum.equals(InfoEnum.HOT);
    }

    public boolean isNew() {
        if (infoEnum == null) {
            return false;
        }
        return infoEnum.equals(InfoEnum.NEW);
    }

}