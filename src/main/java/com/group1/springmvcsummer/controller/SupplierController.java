/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.controller;

import com.group1.springmvcsummer.model.Supplier;
import com.group1.springmvcsummer.service.SupplierService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
/**
 *
 * @author ducan
 */
@Controller
@RequestMapping("/suppliers")
public class SupplierController {
    
    @Autowired
    private SupplierService supplierService;

    @GetMapping("/list")
    public String listSuppliers(Model model) {
        List<Supplier> suppliers = supplierService.getAllSuppliers();
        model.addAttribute("suppliers", suppliers);
        return "listSuppliers";
    }

    @GetMapping("/showAddForm")
    public String showAddForm(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "addSupplier";
    }

    @PostMapping("/add")
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier) {
        supplierService.addSupplier(supplier);
        return "redirect:/suppliers/list";
    }

    @GetMapping("/showEditForm")
    public String showEditForm(@RequestParam("id") Long supplierId, Model model) {
        Supplier supplier = supplierService.getSupplierById(supplierId);
        model.addAttribute("supplier", supplier);
        return "editSupplier";
    }

    @PostMapping("/update")
    public String updateSupplier(@ModelAttribute("supplier") Supplier supplier) {
        supplierService.updateSupplier(supplier);
        return "redirect:/suppliers/list";
    }

    @GetMapping("/showDeleteForm")
    public String showDeleteForm(@RequestParam("id") Long supplierId, Model model) {
        Supplier supplier = supplierService.getSupplierById(supplierId);
        model.addAttribute("supplier", supplier);
        return "deleteSupplier";
    }

    @PostMapping("/confirmDelete")
    public String deleteSupplier(@RequestParam("id") Long supplierId) {
        supplierService.deleteSupplier(supplierId);
        return "redirect:/suppliers/list";
    }

    @GetMapping("/searchByName")
    public String searchSupplierByName(@RequestParam("name") String name, Model model) {
        List<Supplier> suppliers = supplierService.searchSuppliersByName(name);
        model.addAttribute("suppliers", suppliers);
        return "listSuppliers";
    }
}