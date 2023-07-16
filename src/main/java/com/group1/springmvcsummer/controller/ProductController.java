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
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    @GetMapping("/list")
    public String productList(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "productList";
    }
//    @PostMapping("/addOrUpdate")
//    public String addOrUpdateProduct(@ModelAttribute("product") Product product, @RequestBody("admin") a adminId) {
//        
//    }
}