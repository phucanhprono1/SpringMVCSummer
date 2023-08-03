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
    @Column(unique = true, columnDefinition = "nvarchar(255)")
    
    private String name;
    private float price;
    
    @Column(columnDefinition = "nvarchar(255)") // Adjust the length as needed
    private String color;

    @Column(columnDefinition = "nvarchar(max)") // Adjust the length as needed
    private String description;

    @Column(columnDefinition = "nvarchar(max)") // Adjust the length as needed
    private String image;

    @Column(columnDefinition = "nvarchar(50)") // Adjust the length as needed
    private String size;

    @Column(columnDefinition = "nvarchar(10)") // Adjust the length as needed
    private String gender;

    @Column(columnDefinition = "nvarchar(255)") // Adjust the length as needed
    private String brand;
    private int quantity;
    private int numberSell;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
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
