/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.service.CategoryService;
import com.group1.springmvcsummer.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author phucanh
 */
@Controller
public class HomeController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

    @GetMapping("/category")
    public String viewAllCategories(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
       
        return "home";
    }

    @GetMapping("/category/products")
    public String viewAllProductByCategory(Model model, @RequestParam("id") Long id) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("prodByCate", productService.getProductByCategoryId(id));
        return "home";
    }
}
