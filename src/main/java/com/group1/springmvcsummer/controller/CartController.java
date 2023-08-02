/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.repository.UserRepository;
import com.group1.springmvcsummer.service.CartService;
import java.util.function.Supplier;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Phuc Anh
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    public CartController(CartService cartService, CartRepository cartRepository) {
        this.cartService = cartService;
        this.cartRepository = cartRepository;
    }

    @GetMapping("/view")
    public String getCartByCustomerId(
            HttpSession session,
            Model model
    ) throws Exception {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }
        model.addAttribute("user",user);
        // Get the user ID from the User object
        Long customerId = user.getId();

        // Use the customerId to fetch the Cart
        Cart cart = cartRepository.findByUserId(customerId);

        model.addAttribute("cart", cart);
        return "cart";
    }

    @PostMapping("/add/{productId}")
    public String addProductToCart(
            HttpSession session,
            @PathVariable Long productId,
            @RequestParam("quantity") int quantity,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }

        // Get the user ID from the User object
        Long customerId = user.getId();
        model.addAttribute("user",user);
        // Use the customerId to fetch the Cart
        
        try {
            Cart cart = cartService.addProductToCart(customerId, productId, quantity);
            model.addAttribute("cart", cart);
            return "redirect:/cart/view";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/remove/{productId}")
    public String removeProductFromCart(
            @PathVariable Long productId,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }
        model.addAttribute("user",user);
        // Get the user ID from the User object
        Long customerId = user.getId();
        
        try {
            Cart cart = cartService.removeProductFromCart(customerId, productId);
            model.addAttribute("cart", cart);
            return "redirect:/cart/view";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/removeAll")
    public String removeAllProductFromCart(
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }
        model.addAttribute("user",user);
        // Get the user ID from the User object
        Long customerId = user.getId();
        try {
            Cart cart = cartService.removeAllProduct(customerId);
            model.addAttribute("cart", cart);
            return "redirect:/cart/view";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/increase/{productId}")
    public String increaseProductQuantity(
            @PathVariable Long productId,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }
        model.addAttribute("user",user);
        // Get the user ID from the User object
        Long customerId = user.getId();
        try {
            Cart cart = cartService.increaseProductQuantity(customerId, productId);
            model.addAttribute("cart", cart);
            return "redirect:/cart/view";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }

    @PostMapping("/decrease/{productId}")
    public String decreaseProductQuantity(
            @PathVariable Long productId,
            HttpSession session,
            Model model
    ) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // Handle the case when the user is not logged in
            return "redirect:/login";
        }
        model.addAttribute("user",user);
        // Get the user ID from the User object
        Long customerId = user.getId();
        try {
            Cart cart = cartService.decreaseProductQuantity(customerId, productId);
            model.addAttribute("cart", cart);
            return "redirect:/cart/view";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "error";
        }
    }
}
