/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Category;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.Supplier;
import com.group1.springmvcsummer.service.CategoryService;
import com.group1.springmvcsummer.service.ProductService;
import com.group1.springmvcsummer.service.SupplierService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ducan
 */
@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private SupplierService supplierService;

    @GetMapping("/list")
    public String listProducts(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "listProducts";
    }

    @GetMapping("/showAddForm")
    public String showAddForm(Model model) {
        model.addAttribute("product", new Product());

        // Lấy danh sách Category và Supplier
        List<Category> categories = categoryService.getAllCategories();
        List<Supplier> suppliers = supplierService.getAllSuppliers();

        model.addAttribute("categories", categories);
        model.addAttribute("suppliers", suppliers);

        return "addProduct";
    }

    @PostMapping("/addNew")
    public String addNewProduct(@ModelAttribute("product") Product product) {
        productService.addProduct(product);
        Product savedProduct = productService.getProductByName(product.getName());
        productService.saveProductHistory(savedProduct, product.getQuantity());
        return "redirect:/products/list";
    }

    @PostMapping("/updateQuantity")
    public String updateQuantity(@RequestParam("id") Long productId,
            @RequestParam("quantity") int quantity) {
        Product existingProduct = productService.getProductById(productId);
        existingProduct.setQuantity(existingProduct.getQuantity() + quantity);
        productService.updateProduct(existingProduct);
        productService.saveProductHistory(existingProduct, quantity);
        return "redirect:/products/list";
    }

    @PostMapping("/checkProduct")
    public String checkProduct(@RequestParam(value = "name") String name, Model model) {
        
        List<Category> categories = categoryService.getAllCategories();
        List<Supplier> suppliers = supplierService.getAllSuppliers();

        model.addAttribute("categories", categories);
        model.addAttribute("suppliers", suppliers);
        Product existingProduct = productService.getProductByName(name);
        if (existingProduct != null) {
            model.addAttribute("existingProduct", existingProduct);
        } else {
            model.addAttribute("existingProduct", null);
        }
        return "addProduct";
    }

    @GetMapping("/showEditForm")
    public String showEditForm(@RequestParam("id") Long productId, Model model) {
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "editProduct";
    }

    @PostMapping("/update")
    public String updateProduct(@ModelAttribute("product") Product product, @RequestParam("oldQuantity") int oldQuantity) {
        productService.saveProductHistory(product, oldQuantity);
        productService.updateProduct(product);
        return "redirect:/products/list";
    }

    @GetMapping("/showDeleteForm")
    public String showDeleteForm(@RequestParam("id") Long productId, Model model) {
        Product product = productService.getProductById(productId);
        model.addAttribute("product", product);
        return "deleteProduct";
    }

    @PostMapping("/confirmDelete")
    public String deleteProduct(@RequestParam("id") Long productId) {
        productService.deleteProduct(productId);
        return "redirect:/products/list";
    }

    @GetMapping("/searchByName")
    public String searchProductByName(@RequestParam("name") String name, Model model) {
        List<Product> products = productService.searchProductsByName(name);
        model.addAttribute("products", products);
        return "listProducts";
    }
}
