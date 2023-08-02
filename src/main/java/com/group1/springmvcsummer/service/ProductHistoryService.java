/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.ProductHistory;
import com.group1.springmvcsummer.repository.ProductHistoryRepository;
import java.util.Collections;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ducan
 */
@Service
@RequiredArgsConstructor
public class ProductHistoryService {
    @Autowired
    private final ProductHistoryRepository productHistoryRepository;

    public List<ProductHistory> getProductHistory(Long productId) {
       List<ProductHistory> productHistory = productHistoryRepository.findByProduct(productId);
      
        if (productHistory != null) {
            return productHistory;
        } else {
            return Collections.emptyList();
        }
    }
    public List<ProductHistory> getAllProductHistory() {
        return productHistoryRepository.findAll();
    }
}