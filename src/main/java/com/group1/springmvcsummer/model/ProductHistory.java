/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import java.time.LocalDateTime;
import javax.persistence.*;
import lombok.*;

/**
 *
 * @author ducan
 */
@Entity
@Table(name = "tbl_product_history")
@Data
public class ProductHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

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

    @Column(name = "change_time")
    private LocalDateTime changeTime;


    public ProductHistory(Product product) {
        this.name = product.getName();
        this.price = product.getPrice();
        this.color = product.getColor();
        this.description = product.getDescription();
        this.image = product.getImage();
        this.size = product.getSize();
        this.manufacturer = product.getManufacturer();
        this.quantity = product.getQuantity();
        this.numberSell = product.getNumberSell();
        this.changeTime = LocalDateTime.now();
    }
}
