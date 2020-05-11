package com.emreuzun.springmvc.service;

import com.emreuzun.springmvc.dao.UserRepository;
import com.emreuzun.springmvc.exception.UserNotFoundException;
import com.emreuzun.springmvc.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceMockImpl implements UserService {

    private UserRepository userRepository;

    @Autowired
    public void setOwnerRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findById(Long id) {
        User user = userRepository.findById(id);
        if (user == null) {
            throw new UserNotFoundException("User not found with id :" + id);
        }
        return user;
    }

    @Override
    public List<User> findByLastName(String lastName) {
        return userRepository.findByLastName(lastName);
    }

    @Override
    public void create(User user) {
        // todo business logic
        userRepository.create(user);
    }

    @Override
    public User update(User user) {
        // todo business logic
        return userRepository.update(user);
    }

    @Override
    public void delete(Long id) {
        // todo business logic
        userRepository.delete(id);
    }
}
