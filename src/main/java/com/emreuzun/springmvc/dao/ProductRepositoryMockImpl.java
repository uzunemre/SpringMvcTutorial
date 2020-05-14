package com.emreuzun.springmvc.dao;

import com.emreuzun.springmvc.enumaration.InfoEnum;
import com.emreuzun.springmvc.model.Product;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Repository
public class ProductRepositoryMockImpl implements ProductRepository {

    private Map<Long, Product> productsMap = new HashMap<>();

    public ProductRepositoryMockImpl() {
        Product product1 = new Product();
        product1.setId(1L);
        product1.setName("Sneakers");
        product1.setDescription("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et maxime vero amet quisquam nihil! Odit, hic fugiat!");
        product1.setInfoEnum(InfoEnum.NEW);
        product1.setPrice(new BigDecimal(254.50));
        product1.setImagePath("../../../../../resources/images/slideshow/img-01.png");
        productsMap.put(product1.getId(), product1);

        Product product2 = new Product();
        product2.setId(2L);
        product2.setName("Belt");
        product2.setDescription("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et maxime vero amet quisquam nihil! Odit, hic fugiat!");
        product2.setInfoEnum(InfoEnum.HOT);
        product2.setPrice(new BigDecimal(122.00));
        product2.setImagePath("../../../../../resources/images/slideshow/img-02.png");
        productsMap.put(product2.getId(), product2);

        Product product3 = new Product();
        product3.setId(3L);
        product3.setName("Camera");
        product3.setDescription("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et maxime vero amet quisquam nihil! Odit, hic fugiat!");
        product3.setPrice(new BigDecimal(1254.50));
        product3.setImagePath("../../../../../resources/images/slideshow/img-03.png");
        productsMap.put(product3.getId(), product3);

        Product product4 = new Product();
        product4.setId(4L);
        product4.setInfoEnum(InfoEnum.NEW);
        product4.setName("T-shirt");
        product4.setAverageStar(5);
        product4.setPrice(new BigDecimal(175.50));
        product4.setOldPrice(new BigDecimal(234.00));
        product4.setImagePath("../../../../../resources/images/shop/img-01.jpg");
        productsMap.put(product4.getId(), product4);

        Product product5 = new Product();
        product5.setId(5L);
        product5.setName("Jacket");
        product5.setAverageStar(5);
        product5.setPrice(new BigDecimal(234.00));
        product5.setImagePath("../../../../../resources/images/shop/img-02.jpg");
        productsMap.put(product5.getId(), product5);

        Product product6 = new Product();
        product6.setId(6L);
        product6.setInfoEnum(InfoEnum.HOT);
        product6.setName("Stylish Watch");
        product6.setInfoEnum(InfoEnum.HOT);
        product6.setAverageStar(4);
        product6.setPrice(new BigDecimal(1345.50));
        product6.setImagePath("../../../../../resources/images/shop/img-03.jpg");
        productsMap.put(product6.getId(), product6);

        Product product7 = new Product();
        product7.setId(7L);
        product7.setName("Woman T-Shirt");
        product7.setAverageStar(3);
        product7.setPrice(new BigDecimal(175.50));
        product7.setImagePath("../../../../../resources/images/shop/img-04.jpg");
        productsMap.put(product7.getId(), product7);

    }

    @Override
    public List<Product> findFeatures() {
        List<Product> productList = productsMap.values().stream().sorted(Comparator.comparing(Product::getId)).collect(Collectors.toList());
        return productList.subList(3, productList.size());
    }

    @Override
    public List<Product> findBanners() {
        List<Product> productList = productsMap.values().stream().sorted(Comparator.comparing(Product::getId)).collect(Collectors.toList());
        return productList.subList(0, 3);
    }

    @Override
    public Product findProduct(long id) {
        return productsMap.get(id);
    }
}
