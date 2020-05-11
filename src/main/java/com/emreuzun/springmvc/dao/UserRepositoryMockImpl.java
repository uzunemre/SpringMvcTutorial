package com.emreuzun.springmvc.dao;

import com.emreuzun.springmvc.model.User;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class UserRepositoryMockImpl implements UserRepository {

    private Map<Long, User> usersMap = new HashMap<>();

    public UserRepositoryMockImpl() {
        User user1 = new User();
        user1.setId(1L);
        user1.setFirstName("Emre");
        user1.setLastName("Uzun");

        User user2 = new User();
        user2.setId(2L);
        user2.setFirstName("Ali");
        user2.setLastName("Uzun");

        User user3 = new User();
        user3.setId(3L);
        user3.setFirstName("Veli");
        user3.setLastName("Uzun");

        usersMap.put(user1.getId(), user1);
        usersMap.put(user2.getId(), user2);
        usersMap.put(user3.getId(), user3);
    }

    @Override
    public List<User> findAll() {
        return new ArrayList<User>(usersMap.values());
    }

    @Override
    public User findById(Long id) {
        return usersMap.get(id);
    }

    @Override
    public List<User> findByLastName(String lastName) {
        return null;
    }

    @Override
    public void create(User user) {
        usersMap.put(user.getId(), user);
    }

    @Override
    public User update(User user) {
        usersMap.replace(user.getId(), user);
        return user;
    }

    @Override
    public void delete(Long id) {
        usersMap.remove(id);
    }
}
