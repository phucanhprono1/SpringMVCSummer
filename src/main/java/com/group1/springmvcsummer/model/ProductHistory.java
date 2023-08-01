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
@NoArgsConstructor
@AllArgsConstructor
public class ProductHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product product;
//    @OneToOne
//    @JoinColumn(name = "admin_id", nullable = false)
//    private Admin admin;

    @Column(name = "new_quantity")
    private int newQuantity;
    
    @Column(name = "change_time")
    private LocalDateTime changeTime;

    public ProductHistory(Product product, int newQuantity) {
        this.product = product;
        this.newQuantity = newQuantity;
        this.changeTime = LocalDateTime.now();
    }
}
