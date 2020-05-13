package com.emreuzun.springmvc.web.tutorial;

import com.emreuzun.springmvc.model.User;
import com.emreuzun.springmvc.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.emreuzun.springmvc.service.UserService;


@Controller
public class UserController {

    private final UserService userService;

    private final UserValidator userValidator;

    public UserController(UserService userService, UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
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
    public String postCreateUser(@ModelAttribute("newUser") User user, BindingResult bindingResult) {
        userValidator.validate(user, bindingResult);
        if (bindingResult.hasErrors()) {
            return "pages/user/edit";
        }
        userService.create(user);
        return "redirect:/users/list";
    }

}
