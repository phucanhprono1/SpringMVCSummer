/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Admin;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.ProductHistory;
import com.group1.springmvcsummer.repository.AdminRepository;
import com.group1.springmvcsummer.repository.ProductHistoryRepository;
import com.group1.springmvcsummer.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ducan
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("admin/")
public class ProductController {

    private final ProductRepository productRepository;
    private final ProductHistoryRepository productHistoryRepository;
    private final AdminRepository adminRepository;

    @GetMapping("/form")
    public String showProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "productForm";
    }

    @PostMapping("/addOrUpdate")
    public String addOrUpdateProduct(@ModelAttribute("product") Product product, @RequestParam("adminId") Long adminId) {
        Admin admin = (Admin) adminRepository.findById(adminId);

        if (admin == null) {
            // Xử lý khi không tìm thấy admin với adminId cung cấp
            return "redirect:/error"; // Điều hướng đến trang lỗi hoặc trang thông báo khác
        }

        // Kiểm tra sản phẩm đã tồn tại trong cơ sở dữ liệu hay chưa
        Product existingProduct = productRepository.findByName(product.getName());

        if (existingProduct != null) {
            // Sản phẩm đã tồn tại, cập nhật số lượng và ghi lại ngày thêm
            existingProduct.setQuantity(existingProduct.getQuantity() + product.getQuantity());
            existingProduct.setNumberSell(existingProduct.getNumberSell() + product.getNumberSell());
            productRepository.save(existingProduct);

            // Ghi lại lịch sử thay đổi
            ProductHistory productHistory = new ProductHistory(existingProduct, admin);
            productHistoryRepository.save(productHistory);
        } else {
            // Sản phẩm chưa tồn tại, thêm mới và ghi lại ngày thêm
            productRepository.save(product);

            // Ghi lại lịch sử thay đổi
            ProductHistory productHistory = new ProductHistory(product, admin);
            productHistoryRepository.save(productHistory);
        }

        return "redirect:/product/success"; // Điều hướng đến trang thành công hoặc trang thông báo khác
    }

    // Các phương thức xử lý trang thành công, trang lỗi, v.v.
    // ...
}