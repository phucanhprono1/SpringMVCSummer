/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Admin;
import com.group1.springmvcsummer.model.Orders;
import com.group1.springmvcsummer.repository.AdminRepository;
import com.group1.springmvcsummer.repository.OrderRepository;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author ducan
 */
@Controller
public class AdminController {

    @Autowired
    private AdminRepository adminRepository;
    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/admin-login")
    public String showLoginAdmin(Model model) {
        return "adminlogin";
    }

    @PostMapping("/admin-login")
    public String processLogin(String name, String password, HttpSession session, Model model) {
        Admin admin = adminRepository.findByUsername(name);
        if (admin != null && admin.getPassword().equals(password)) {
            // Đăng nhập thành công, lưu thông tin vào session
            session.setAttribute("admin", admin);
            model.addAttribute("admin", admin);
            model.addAttribute("name", name);
            return "redirect:/admin";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "redirect:/admin-login";
        }
    }

    @GetMapping("/admin-logout")
    public String logout(HttpSession session) {
        // Invalidate the session to log the user out
        session.invalidate();
        return "redirect:/admin-login"; // Redirect to the login page after logout
    }

    @GetMapping("/admin")
    public String adminhome(Model model) {
        return "admin";
    }

    @GetMapping("/allorder")
    public String allorder(Model model) {
        List<Orders> orders = orderRepository.findAll();
        model.addAttribute("orders", orders);
        return "allorder";
    }
}
