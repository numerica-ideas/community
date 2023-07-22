package com.numericaideas.dockerizespringbootmysql.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.numericaideas.dockerizespringbootmysql.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
}
