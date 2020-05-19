package com.emreuzun.springmvc.web.ecommerce;

import com.emreuzun.springmvc.model.Product;
import com.emreuzun.springmvc.service.ProductService;
import com.emreuzun.springmvc.web.form.BasketForm;
import dto.request.BasketRequest;
import dto.response.GenericResponse;
import dto.response.ProductResponse;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BasketController {

    private final ProductService productService;

    public BasketController(ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping("/basket")
    public ModelAndView getBasketPage() {
        BasketForm basketForm = new BasketForm();
        basketForm.setProducts(productService.findBasket());
        ModelAndView mav = new ModelAndView();
        mav.addObject("basketForm", basketForm);
        mav.setViewName("pages/e-commerce/basket");
        return mav;
    }

    @PostMapping(value = "/basket/purchase")
    public String purchase(@ModelAttribute("contactForm") BasketForm basketForm) {
        // basket form içinde quantity değerleri jsp sayfasından alındı
        productService.clearBasket();
        return "redirect:/e-commerce";
    }

    @ResponseBody
    @PostMapping(value = "/api/basket",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> addToBasket(@RequestBody BasketRequest request) {
        productService.addToBasket(request);
        return ResponseEntity.ok(new GenericResponse("Success"));
    }

    @ResponseBody
    @DeleteMapping(value = "/api/basket",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> removeBasket(@RequestBody BasketRequest request) {
        productService.removeBasket(request);
        return ResponseEntity.ok(new GenericResponse("Success"));
    }

    @ResponseBody
    @GetMapping(value = "/api/basket",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getList() {
        List<ProductResponse> products = productService.findBasketForApi();
        return ResponseEntity.ok(products);
    }


}
