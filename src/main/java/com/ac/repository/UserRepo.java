package com.ac.repository;

import com.ac.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Set;

public interface UserRepo extends JpaRepository<User, Long> {

    User findByUsername(String nickname);
    User findUsersById(Long id);
    User findUsersByEmail(String email);
    User findByActivationCode(String code);
    Set<User> findUsersByUsername(String userName);
}
