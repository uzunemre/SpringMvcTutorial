
package com.emreuzun.springmvc.dao;

import com.emreuzun.springmvc.model.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();

    User findById(Long id);

    List<User> findByLastName(String lastName);

    void create(User owner);

    User update(User owner);

    void delete(Long id);
}