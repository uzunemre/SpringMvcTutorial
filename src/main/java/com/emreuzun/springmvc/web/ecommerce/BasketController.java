package com.emreuzun.springmvc.web.ecommerce;

import com.emreuzun.springmvc.model.Product;
import com.emreuzun.springmvc.service.ProductService;
import dto.request.BasketRequest;
import dto.response.GenericResponse;
import dto.response.ProductResponse;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BasketController {

    private final ProductService productService;

    public BasketController(ProductService productService) {
        this.productService = productService;
    }

    @ResponseBody
    @PostMapping(value = "/api/basket/add",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> addToBasket(@RequestBody BasketRequest request) {
        productService.addToBasket(request);
        return ResponseEntity.ok(new GenericResponse("Success"));
    }

    @ResponseBody
    @GetMapping(value = "/api/basket/list",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getList() {
        List<ProductResponse> products = productService.findBasketForApi();
        return ResponseEntity.ok(products);
    }
}
