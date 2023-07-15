/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import java.time.LocalDate;
import javax.persistence.*;
import lombok.*;

/**
 *
 * @author ducan
 */
@Entity
@Table(name = "tbl_discounts")
@Data
public class Discount {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "discount_code")
    private String discountCode;

    @Column(name = "discount_percentage")
    private double discountPercentage;

    @Column(name = "valid_until")
    private LocalDate validUntil;


}