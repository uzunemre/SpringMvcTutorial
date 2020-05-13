package com.emreuzun.springmvc.service;

import com.emreuzun.springmvc.dao.ProductRepository;
import com.emreuzun.springmvc.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceMockImpl implements ProductService {

    private ProductRepository productRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findFeatures() {
        return productRepository.findFeatures();
    }

    @Override
    public List<Product> findBanners() {
        return productRepository.findBanners();
    }
}
