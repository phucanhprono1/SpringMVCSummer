/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.service.CartService;
import com.group1.springmvcsummer.service.OrderService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Phuc Anh
 */
@Controller
@RequestMapping("order")
public class OrderController {

    // ... existing code ...
    @Autowired
    private OrderService orderService;
    private CartService cartService;
    private CartRepository cartRepository;
    @GetMapping("/addOrder")
    public String showAddOrderForm(@RequestParam Long userId,Model model) {
        
        // Retrieve the authenticated user's ID from the Principal
        
        Cart cart;
        cart = cartRepository.findByUserId(userId);
        

        model.addAttribute("cart", cart);
        // Here you can add additional logic if needed to populate the form with necessary data
        // ...

        // Return the view name of the add order form (addOrder.jsp, thymeleaf, etc.)
        return "addOrder";
    }

    @PostMapping("/submitOrder")
    public String submitOrder(@RequestParam Long userId, @RequestParam String address, @RequestParam String paymentMethod) {
        try {
            // Call the addOrder method from the OrderService
            orderService.addOrder(userId, address, paymentMethod);
            // Redirect to a success page or any other appropriate page
            return "redirect:/orderSuccess";
        } catch (Exception e) {
            // Handle the exception or display an error page
            return "error";
        }
    }

    // ... existing code ...
}
