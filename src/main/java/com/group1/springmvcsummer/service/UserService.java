/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Phuc Anh
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CartRepository cartRepository;

    

    
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

 
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

  
    public void save(User user) {
        Cart c = new Cart();
        c.setUser(user);
        c.setProduct_quantity(0);
        c.setTotal_price(0);
        cartRepository.save(c);
        userRepository.save(user);
    }
}