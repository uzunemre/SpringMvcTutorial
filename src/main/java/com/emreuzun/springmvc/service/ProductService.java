package com.emreuzun.springmvc.service;

import com.emreuzun.springmvc.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findFeatures();
    List<Product> findBanners();
}
