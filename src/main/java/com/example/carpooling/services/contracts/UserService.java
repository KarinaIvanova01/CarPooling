package com.example.carpooling.services.contracts;

import com.example.carpooling.models.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    Optional<User> getById(long id);

    List<User> getAll();

    User getByUsername(String username);
}
