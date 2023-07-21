/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.repository;

import com.group1.springmvcsummer.model.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Phuc Anh
 */
@Repository
public interface UserRepository extends JpaRepository<User,Long>{
    
   
    public Optional<User> findById(Long customerId);
    
}