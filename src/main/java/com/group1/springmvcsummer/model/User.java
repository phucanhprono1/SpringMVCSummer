/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 *
 * @author ducan
 */
@Data
@Entity
@Table(name = "tbl_user")
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(unique = true, name = "id")
    private Long id;
    @Column(unique = true, name = "email")
    public String email;
    @Column(name = "password")
    private String password;
    @Column(name = "gender")
    private String gender;
    @Column(unique = true, name = "username")
    private String username;
    @Column(columnDefinition = "nvarchar(255)") // Adjust the length as needed
    private String name;
    @Transient
    private String confirmPassword;
}
