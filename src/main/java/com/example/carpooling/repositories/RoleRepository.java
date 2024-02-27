package com.example.carpooling.repositories;

import com.example.carpooling.models.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    Role findByAuthority(String authority);
}
