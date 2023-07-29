/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.CartItem;
import com.group1.springmvcsummer.model.OrderItem;
import com.group1.springmvcsummer.model.Orders;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.repository.OrderItemRepository;
import com.group1.springmvcsummer.repository.OrderRepository;
import com.group1.springmvcsummer.repository.ProductRepository;
import com.group1.springmvcsummer.repository.UserRepository;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Phuc Anh
 */
@Service
@RequiredArgsConstructor
public class OrderService {

    @Autowired
    private OrderRepository orderRepo;
    public List<Orders> getAllOrdersByUserId(Long userId) {
        return orderRepo.viewAllOrdersByUserId(userId);
    }
    @Autowired
    private OrderItemRepository orderItemRepo;
    @Autowired
    private CartRepository cartRepo;
    @Autowired
    private CartService cartService;
    @Autowired
    private ProductRepository productRepo;
    @Autowired
    private UserRepository userRepo;

    public Orders addOrder(Long cid, String address,String paymentMethod) throws Exception{

 
        Cart cart = cartRepo.findByUserId(cid);
        Optional<User> userOpt = userRepo.findById(cid);
        User user = new User();
        if(!userOpt.isEmpty()){
            user = userOpt.get();
        }       
        Orders order = new Orders();
        
        order.setUser(user);
        order.setDate(LocalDateTime.now());
        order.setOrderStatus("Pending");
        order.setPaymentStatus("Pending");
        order.setLocation(address);
//
        order.setPaymentMethod(paymentMethod);
        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setProduct(cartItem.getProduct());
            orderItem.setQuantity(cartItem.getQuantity());
            Product p = cartItem.getProduct();
            p.setQuantity(p.getQuantity() - cartItem.getQuantity());
            p.setNumberSell(p.getNumberSell() + cartItem.getQuantity());
            productRepo.save(p);
//			orderItem.setOrder(order);
            orderItems.add(orderItem);
            orderItemRepo.save(orderItem);
        }
        
        order.setOrderItems(orderItems);
        order.setTotal_price(cart.getTotal_price());
        Orders savedOrder = orderRepo.save(order);
        //xóa cart của customer sau khi order
        cartService.removeAllProduct(cid);

        return savedOrder;
    }

    
}
