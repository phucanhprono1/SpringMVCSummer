/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Admin;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.ProductHistory;
import com.group1.springmvcsummer.repository.ProductHistoryRepository;
import com.group1.springmvcsummer.repository.ProductRepository;
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
    private final ProductHistoryRepository productHistoryRepository;

    public void addOrUpdateProduct(Product product, Admin admin) {
        // Kiểm tra sản phẩm đã tồn tại trong cơ sở dữ liệu hay chưa
        Product existingProduct = productRepository.findByName(product.getName());

        if (existingProduct != null) {
            // Sản phẩm đã tồn tại, cập nhật số lượng và ghi lại ngày thêm
            existingProduct.setQuantity(existingProduct.getQuantity() + product.getQuantity());
            existingProduct.setNumberSell(existingProduct.getNumberSell() + product.getNumberSell());
            productRepository.save(existingProduct);

            // Ghi lại lịch sử thay đổi
            ProductHistory productHistory = new ProductHistory(existingProduct,admin);
            productHistoryRepository.save(productHistory);
        } else {
            // Sản phẩm chưa tồn tại, thêm mới và ghi lại ngày thêm
            productRepository.save(product);

            // Ghi lại lịch sử thay đổi
            ProductHistory productHistory = new ProductHistory(product,admin);
            productHistoryRepository.save(productHistory);
        }
    }

}
