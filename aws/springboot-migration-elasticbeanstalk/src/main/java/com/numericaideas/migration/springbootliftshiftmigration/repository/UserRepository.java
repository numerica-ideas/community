package com.numericaideas.migration.springbootliftshiftmigration.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.numericaideas.migration.springbootliftshiftmigration.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
}
