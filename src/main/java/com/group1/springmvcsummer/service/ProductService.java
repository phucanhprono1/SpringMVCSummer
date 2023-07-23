/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.ProductHistory;
import com.group1.springmvcsummer.repository.ProductHistoryRepository;
import com.group1.springmvcsummer.repository.ProductRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ducan
 */
@Service
@RequiredArgsConstructor
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ProductHistoryRepository productHistoryRepository;


    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id);
    }

    @Transactional
    public void addProduct(Product product) {
        productRepository.save(product);
    }


    @Transactional
    public void updateProduct(Product product) {
        productRepository.save(product);
    }

    @Transactional
    public void deleteProduct(Long id) {
        Product product = getProductById(id);
        if (product != null) {
            // Remove associated ProductHistory entries
            List<ProductHistory> productHistories = product.getProductHistories();
            if (productHistories != null && !productHistories.isEmpty()) {
                productHistories.forEach(productHistory -> {
                    productHistory.setProduct(null);
                    productHistoryRepository.delete(productHistory);
                });
            }

            // Delete the Product entity
            productRepository.delete(product);
        }
    }
    @Transactional
    public ProductHistory saveProductHistory(Product product, int newQuantity) {
        ProductHistory productHistory = new ProductHistory(product, newQuantity);
        return productHistoryRepository.save(productHistory);
    }
    
    public List<Product> searchProductsByName(String name) {
        return productRepository.findByNamelike(name);
    }

    public Product getProductByName(String name) {
        return productRepository.findByName(name);
    }
}
