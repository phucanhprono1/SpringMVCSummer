/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author ducan
 */
@Data
@Entity
@Table(name="tbl_order")
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private LocalDateTime date;
	private String orderStatus;
	private String location;
	@Column(name="total_price")
	private float total_price;
        
        @OneToOne
        private Discount discount;

	private String paymentMethod;
	private String paymentStatus;


	@ManyToOne(cascade = CascadeType.ALL)
	private User user;

	@OneToMany(cascade = CascadeType.ALL)
	private List<OrderItem> orderItems = new ArrayList<>() ;

}
