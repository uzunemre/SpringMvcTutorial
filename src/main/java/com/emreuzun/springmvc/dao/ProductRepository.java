package com.emreuzun.springmvc.dao;

import com.emreuzun.springmvc.model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findFeatures();
    List<Product> findBanners();
}
