/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import javax.persistence.*;
import lombok.*;
import java.util.List;

/**
 *
 * @author ducan
 */
@Data
@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Long id;
    @Column(unique = true)
    private String name;
    private float price;
    private String color;
    private String description;
    private String image;
    private String size;
    private String gender;
    private String brand;
    private int quantity;
    private int numberSell;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ProductHistory> productHistories;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private List<Comment> listComment;
    
    @ManyToOne
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

   
}
