/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.repository.ProductRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 *
 * @author ducan
 */
@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    
    public Product saveProduct(Product product){
        return productRepository.save(product);
    }
    public Product findProductById(Long Id){
        return productRepository.findById(Id);
    }
    
    public List<Product> getAllProduct(){
        return productRepository.findAll();
    }

    public Product findProductByName(String name) {
        return productRepository.findByName(name);
    }
}
