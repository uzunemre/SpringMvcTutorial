package com.emreuzun.springmvc.web.form;

import com.emreuzun.springmvc.model.Product;

import java.util.List;

public class BasketForm {

    private List<Product> products;

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}
