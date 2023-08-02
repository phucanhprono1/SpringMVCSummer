/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.repository.UserRepository;
import com.group1.springmvcsummer.service.UserService;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Phuc Anh
 */
@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Trả về trang login.jsp
    }

    @PostMapping("/login")
    public String processLogin(String username, String password, HttpSession session, Model model) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            // Đăng nhập thành công, lưu thông tin vào session
            session.setAttribute("user", user);
            model.addAttribute("username", username);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "redirect:/login";
        }
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") @Valid User user,
                               BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "register";
        }
        if(!user.getPassword().equals(user.getConfirmPassword())){
            model.addAttribute("registrationError", "Confirm Password is not correct");
            return "register";
        }
        // Check if email or username already exists
        if (userService.existsByEmail(user.getEmail()) || userService.existsByUsername(user.getUsername())) {
            model.addAttribute("registrationError", "Email or username already exists.");
            return "register";
        }

        // Save the new user
        userService.save(user);

        return "redirect:/login"; // Redirect to the login page after successful registration
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Invalidate the session to log the user out
        session.invalidate();
        return "redirect:/"; // Redirect to the login page after logout
    }
}
