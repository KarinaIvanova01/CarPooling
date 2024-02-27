package com.example.carpooling.services;

import com.example.carpooling.exceptions.AuthorizationException;
import com.example.carpooling.exceptions.EntityNotFoundException;
import com.example.carpooling.models.User;
import com.example.carpooling.repositories.UserRepository;
import com.example.carpooling.services.contracts.UserService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service

public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    private final AuthorizationException authorizationException;


    public UserServiceImpl(UserRepository userRepository, AuthorizationException authorizationException) {
        this.userRepository = userRepository;
        this.authorizationException = authorizationException;
    }

  @Override
  public Optional<User> getById(long id){
    Optional<User> user = userRepository.findById(id);
    if (user.isEmpty()) {
        throw new EntityNotFoundException("User", id);
    } else return user;
}

@Override
    public List<User> getAll(){
        return userRepository.findAll();
}

    @Override
    public User getByUsername(String username) {
        return userRepository.findByUsername(username).orElseThrow(() -> new EntityNotFoundException("User", "username", username));
    }


}
