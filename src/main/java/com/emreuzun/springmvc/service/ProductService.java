package com.emreuzun.springmvc.service;

import com.emreuzun.springmvc.model.Product;
import dto.request.BasketRequest;
import dto.response.ProductResponse;

import java.util.List;

public interface ProductService {
    List<Product> findFeatures();

    List<Product> findBanners();

    List<Product> findBasket();

    List<ProductResponse> findBasketForApi();

    void addToBasket(BasketRequest request);

    void removeBasket(BasketRequest product);

    void clearBasket();

}
