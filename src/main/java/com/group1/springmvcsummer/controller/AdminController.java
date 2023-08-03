/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Admin;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.AdminRepository;
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
    
    @GetMapping("/admin-login")
    public String showLoginAdmin(Model model){
        return "adminlogin";
    }
    
    @PostMapping("/admin-login")
    public String processLogin(String username, String password, HttpSession session, Model model) {
        Admin admin = adminRepository.findByUsername(username);
        if (admin != null && admin.getPassword().equals(password)) {
            // Đăng nhập thành công, lưu thông tin vào session
            session.setAttribute("admin", admin);
            model.addAttribute("username", username);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "redirect:/admin";
        }
    }
}
