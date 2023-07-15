/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import java.io.Serializable;
import javax.persistence.*;
import lombok.*;
import java.util.List;

/**
 *
 * @author ducan
 */
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_product")
public class Item implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true)
    private Integer id;
    @Column(unique = true)
    private String name;
    private float price;
    private String color;
    private String description;
    private String image;
    private String size;
    private String manufacturer;
    private int quantity;
    private int numberSell;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category cate;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private List<Comment> listComment;
    private Integer rating;
}
