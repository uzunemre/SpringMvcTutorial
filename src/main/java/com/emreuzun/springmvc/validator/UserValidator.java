package com.emreuzun.springmvc.validator;

import com.emreuzun.springmvc.model.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return false;
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"firstName","required.firstName");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"lastName","required.lastName");
    }
}
