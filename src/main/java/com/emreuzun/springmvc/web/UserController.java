package com.emreuzun.springmvc.web;

import com.emreuzun.springmvc.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.emreuzun.springmvc.service.UserService;


@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/users/list")
    public ModelAndView getUsers() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("users", userService.findAll());
        mav.setViewName("pages/user/list");
        return mav;
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String getNewUserForm(@ModelAttribute("newUser") User user) {
        return "pages/user/edit";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String postCreateUser(@ModelAttribute("newUser") User user) {
        userService.create(user);
        return "redirect:/users/list";
    }

}
