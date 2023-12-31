/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.repository;

import com.group1.springmvcsummer.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ducan
 */
@Repository
public interface AdminRepository extends JpaRepository<Admin, Long>{

    public Admin findById(Long adminId);
    @Query("SELECT a from Admin a where a.name =:name")
    public Admin findByUsername(@Param("name")String name);
    
}
