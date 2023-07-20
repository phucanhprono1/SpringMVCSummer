/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Supplier;
import com.group1.springmvcsummer.repository.SupplierRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ducan
 */
@Service
@RequiredArgsConstructor
public class SupplierService {
    @Autowired
    private SupplierRepository supplierRepository;


    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }


    public Supplier getSupplierById(Long id) {
        return supplierRepository.findById(id);
    }

    @Transactional
    public void addSupplier(Supplier supplier) {
        supplierRepository.save(supplier);
    }

    @Transactional
    public void updateSupplier(Supplier supplier) {
        supplierRepository.save(supplier);
    }

    @Transactional
    public void deleteSupplier(Long id) {
        supplierRepository.deleteById(id);
    }

    public List<Supplier> searchSuppliersByName(String name) {
        return supplierRepository.findByNameContainingIgnoreCase(name);
    }
    
}
