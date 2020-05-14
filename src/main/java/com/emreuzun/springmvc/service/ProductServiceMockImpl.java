package com.emreuzun.springmvc.service;

import com.emreuzun.springmvc.dao.ProductRepository;
import com.emreuzun.springmvc.model.Product;
import dto.request.BasketRequest;
import dto.response.ProductResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class ProductServiceMockImpl implements ProductService {

    private ProductRepository productRepository;

    private Map<Long, Product> basketMap = new HashMap<>();

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

    @Override
    public List<Product> findBasket() {
        return basketMap.values().stream().sorted(Comparator.comparing(Product::getName)).collect(Collectors.toList());
    }

    @Override
    public List<ProductResponse> findBasketForApi() {
        List<ProductResponse> productResponseList = new ArrayList<>();
        for (Product product : findBasket()){
            ProductResponse productResponse = new ProductResponse();
            productResponse.setId(product.getId());
            productResponse.setName(product.getName());
            productResponse.setImagePath(product.getImagePath());
            productResponseList.add(productResponse);
        }
        return productResponseList;
    }

    @Override
    public void addToBasket(BasketRequest request) {
        Product product = productRepository.findProduct(request.getProductId());
        basketMap.put(product.getId(), product);
    }

    @Override
    public void removeBasket(BasketRequest request) {

    }


}
