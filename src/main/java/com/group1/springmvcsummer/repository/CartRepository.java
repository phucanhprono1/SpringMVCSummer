/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.repository;


import com.group1.springmvcsummer.model.Cart;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Phuc Anh
 */
@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{
    @Query("Select c from Cart c where c.user.id = :customerId")
    public Cart findByUserId(@Param("customerId")Long customerId);
    
}
