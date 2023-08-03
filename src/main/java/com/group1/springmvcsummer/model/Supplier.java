/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import java.util.List;
import javax.persistence.*;
import lombok.*;

/**
 *
 * @author ducan
 */
@Entity
@Table(name = "tbl_suppliers")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name",columnDefinition = "nvarchar(255)")
    private String name;

    @Column(name = "address",columnDefinition = "nvarchar(255)")
    private String address;

//    @OneToMany(cascade = CascadeType.ALL)
//    private List<Product> products;
}