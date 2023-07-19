/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.UserRepository;
import com.group1.springmvcsummer.service.CartService;
import java.util.function.Supplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Phuc Anh
 */
@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;
    private final UserRepository userRepository;

    @Autowired
    public CartController(CartService cartService, UserRepository userRepository) {
        this.cartService = cartService;
        this.userRepository = userRepository;
    }

    @GetMapping("/view/{customerId}")
    public String getCartByCustomerId(
            @PathVariable(value = "customerId") Long customerId,
            Model model
    ) throws Exception {
        User customer = userRepository.findById(customerId).orElseThrow(new Supplier<Exception>() {
            @Override
            public Exception get() {
                return new Exception("Customer not found!");
            }
        });
        Cart cart = customer.getCart();
        model.addAttribute("cart", cart);
        return "cart";
    }

    @PostMapping("/add/{customerId}/{productId}/{quantity}")
    public String addProductToCart(
            @PathVariable Long customerId,
            @PathVariable Long productId,
            @PathVariable int quantity,
            Model model
    ) {
        try {
            Cart cart = cartService.addProductToCart(customerId, productId, quantity);
            model.addAttribute("cart", cart);
            return "cart";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PutMapping("/remove/{customerId}/{productId}")
    public String removeProductFromCart(
            @PathVariable Long customerId,
            @PathVariable Long productId,
            Model model
    ) {
        try {
            Cart cart = cartService.removeProductFromCart(customerId, productId);
            model.addAttribute("cart", cart);
            return "cart";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @DeleteMapping("/removeAll/{customerId}")
    public String removeAllProductFromCart(
            @PathVariable Long customerId,
            Model model
    ) {
        try {
            Cart cart = cartService.removeAllProduct(customerId);
            model.addAttribute("cart", cart);
            return "cart";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PutMapping("/increase/{customerId}/{productId}")
    public String increaseProductQuantity(
            @PathVariable Long customerId,
            @PathVariable Long productId,
            Model model
    ) {
        try {
            Cart cart = cartService.increaseProductQuantity(customerId, productId);
            model.addAttribute("cart", cart);
            return "cart";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PutMapping("/decrease/{customerId}/{productId}")
    public String decreaseProductQuantity(
            @PathVariable Long customerId,
            @PathVariable Long productId,
            Model model
    ) {
        try {
            Cart cart = cartService.decreaseProductQuantity(customerId, productId);
            model.addAttribute("cart", cart);
            return "cart";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
}
