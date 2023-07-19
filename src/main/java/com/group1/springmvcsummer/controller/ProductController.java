/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ducan
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("/form")
    public String showProductForm(@RequestParam(name = "id", required = false) Long productId, Model model) {
        // Kiểm tra xem có sản phẩm đã tồn tại hay không
        Product product = productService.findProductById(productId);
        if (product == null) {
            product = new Product(); // Tạo mới sản phẩm nếu chưa tồn tại
        }

        model.addAttribute("product", product);

        // Truyền thông tin về sự tồn tại của sản phẩm và số lượng cần nhập
        model.addAttribute("productExists", product.getId() != null);
        model.addAttribute("quantityToInput", product.getQuantity());

        return "productForm";
    }

    @GetMapping("/list")
    public String productList(Model model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products", products);
        return "productList";
    }

    @GetMapping("/search")
    @ResponseBody
    public Product searchProductByName(@RequestParam("name") String name) {
        // Tìm sản phẩm dựa trên tên
        Product product = productService.findProductByName(name);

        // Trả về thông tin sản phẩm dưới dạng JSON
        return product;
    }

//    @PostMapping("/addOrUpdate")
//    public String addOrUpdateProduct(@ModelAttribute("product") Product product, @RequestBody("admin") a adminId) {
//        
//    }
}
