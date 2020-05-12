package com.emreuzun.springmvc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JstlController {

    @RequestMapping("/jstl/tags")
    public String getUsers() {
        return "pages/jstl/tags";
    }

}
