/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.service.CartService;
import com.group1.springmvcsummer.service.OrderService;
import javax.servlet.http.HttpSession;

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
@RequestMapping("/order")
public class OrderController {

    // ... existing code ..
    private final OrderService orderService;
    private final CartService cartService;
    private final CartRepository cartRepository;

    @Autowired
    public OrderController(OrderService orderService, CartService cartService, CartRepository cartRepository) {
        this.orderService = orderService;
        this.cartService = cartService;
        this.cartRepository = cartRepository;
    }

    @GetMapping("/orderForm")
    public String showAddOrderForm(HttpSession session, Model model) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Long userId = user.getId();
        model.addAttribute("user", user);
        Cart cart = cartService.viewCartByUserId(userId);
        if (cart == null) {

            return "redirect:/";
        }
        String errorMessage = (String) session.getAttribute("errorMessage");
        model.addAttribute("errorMessage", errorMessage);
        session.removeAttribute("errorMessage");
        model.addAttribute("cart", cart);

        return "addOrder";
    }

    @PostMapping("/submitOrder")
    public String submitOrder(HttpSession session, Model model, @RequestParam String address, @RequestParam String paymentMethod) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Long userId = user.getId();
        model.addAttribute("user", user);
        try {
            orderService.addOrder(userId, address, paymentMethod);
            return "redirect:/";
        } catch (Exception e) {
            session.setAttribute("errorMessage", e.getMessage());
            return "redirect:/order/orderForm";
        }
    }    
}
