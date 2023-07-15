/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import javax.persistence.*;
import lombok.Data;


/**
 *
 * @author ducan
 */
@Data
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer cId;
    private String name;
    @Column(unique = true, name = "username")
    private String username;
    @Column(unique = true, name = "phone_number")
    private String phone_number;
    @Column(unique = false, name = "email")
    private String email;
    private String password;
    private String address;

}
