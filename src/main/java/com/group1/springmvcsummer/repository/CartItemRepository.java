/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.repository;

import com.group1.springmvcsummer.model.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author ducan
 */
public interface CartItemRepository extends JpaRepository<CartItem, Integer>{
    
}
