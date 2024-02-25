package com.example.carpooling.repositories;

import com.example.carpooling.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

  Optional<User> findByUsername( String username);
  User findByEmai(String email0);









}
