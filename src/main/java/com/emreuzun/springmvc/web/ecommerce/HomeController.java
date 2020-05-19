package com.emreuzun.springmvc.web.ecommerce;

import com.emreuzun.springmvc.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    private final ProductService productService;

    public HomeController(ProductService productService) {
        this.productService = productService;
    }


    @RequestMapping("/e-commerce")
    public ModelAndView getHomePage() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("pages/e-commerce/home");
        mav.addObject("banners",productService.findBanners());
        mav.addObject("features",productService.findFeatures());
        return mav;
    }

}
