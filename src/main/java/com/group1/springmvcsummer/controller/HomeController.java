/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Category;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.service.CategoryService;
import com.group1.springmvcsummer.service.ProductService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/")
    public String homepage(Model model, HttpSession session) {
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("allproducts", productService.getAllProducts());
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "home";
    }

    @GetMapping("/category")
    public String viewAllCategories(Model model, HttpSession session) {
        model.addAttribute("categories", categoryService.getAllCategories());
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return "home";
    }

    @GetMapping("/products")
    public String viewAllProductByCategory(Model model, @RequestParam("cid") Long id, HttpSession session) {
        model.addAttribute("categories", categoryService.getAllCategories());
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        if (id != null) {
            model.addAttribute("prodByCate", productService.getProductByCategoryId(id));
            // Lấy thông tin tên category và truyền vào Model
            Category selectedCategory = categoryService.getCategoryById(id);
            model.addAttribute("selectedCategoryName", selectedCategory.getName());
        } else {
            model.addAttribute("allproducts", productService.getAllProducts());
        }
        return "home";
    }

    @GetMapping("/product/{id}")
    public String viewProductDetails(Model model, @PathVariable("id") Long productId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        // Get product details based on the productId
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "productDetails"; // Create a JSP page for product details
    }
}
