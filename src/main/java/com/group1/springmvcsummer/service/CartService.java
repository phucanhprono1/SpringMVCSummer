/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group1.springmvcsummer.service;

import com.group1.springmvcsummer.model.Cart;
import com.group1.springmvcsummer.model.CartItem;
import com.group1.springmvcsummer.model.Product;
import com.group1.springmvcsummer.model.User;
import com.group1.springmvcsummer.repository.CartItemRepository;
import com.group1.springmvcsummer.repository.CartRepository;
import com.group1.springmvcsummer.repository.ProductRepository;
import com.group1.springmvcsummer.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Phuc Anh
 */
@Service
public class CartService {

    @Autowired
    private CartRepository cRepo;

    @Autowired
    private UserRepository crRepo;

    @Autowired
    private ProductRepository pRepo;
    @Autowired
    private CartItemRepository cartItemRepo;
    
    public Cart viewCartByUserId(Long userId)throws Exception{
        return cRepo.findByUserId(userId);
    }

    public Cart addProductToCart(Long customerId, Long productId, int quantity)
            throws Exception{
        Cart cart;
        cart = cRepo.findByUserId(customerId);
        Product itemOpt = pRepo.findById(productId);
        if (itemOpt==null) {
            throw new Exception("Product not found!");
        }
        CartItem cartItem = new CartItem();
        cartItem.setProduct(itemOpt);
        cartItem.setQuantity(quantity);

        // Get the cart for the user, or create a new cart if one doesn't exist
      
        List<CartItem> cartItems = cart.getCartItems();
        boolean flag = true;
        for (int i = 0; i < cartItems.size(); i++) {
            if (cartItems.get(i).getProduct().getId() == productId) {
                cartItems.get(i).setQuantity(cartItems.get(i).getQuantity() + quantity);
                flag = false;
                break;
            }
        }
        if (flag) {
            CartItem cit = new CartItem();
            cit.setProduct(itemOpt);
            cit.setQuantity(quantity);

            cartItemRepo.save(cit);
            cartItems.add(cit);
        }
        if (cart.getProduct_quantity() == null || cart.getProduct_quantity() == 0) {
            cart.setProduct_quantity(quantity);
        } else {
            cart.setProduct_quantity(cart.getProduct_quantity() + quantity);
        }
        cart.setCartItems(cartItems);
        float total = 0;

        for (CartItem c : cartItems) {
            total += c.getProduct().getPrice() * c.getQuantity();
        }
        cart.setTotal_price(total);
        cRepo.save(cart);
        return cart;

    }

    @Transactional
    public Cart removeProductFromCart(Long customerId, Long productId)
            throws Exception{
        Optional<User> opt = crRepo.findById(customerId);
        if (opt.isEmpty()) {
            throw new Exception("Customer not found!");
        }

        Product itemOpt = pRepo.findById(productId);
        if (itemOpt == null) {
            throw new Exception("Product not found!");
        }
        User customer = opt.get();
        Cart cart;
        cart = cRepo.findByUserId(customerId);
        List<CartItem> itemList = cart.getCartItems();
        boolean flag = false;
        for (int i = 0; i < itemList.size(); i++) {
            CartItem element = itemList.get(i);
            if (productId == element.getProduct().getId()) {
                cart.setProduct_quantity(cart.getProduct_quantity() - element.getQuantity());
                itemList.remove(element);
                flag = true;
                break;
            }
        }
        if (!flag) {
            throw new Exception("Product not removed from cart");
        }

        cart.setCartItems(itemList);
        float total = 0;
        for (CartItem c : itemList) {
            total += c.getProduct().getPrice() * c.getQuantity();
        }
        cart.setTotal_price(total);
        cRepo.save(cart);
        return cart;

    }

    @Transactional
    public Cart removeAllProduct(Long customerId) throws Exception {
       
        Cart c;
        c = cRepo.findByUserId(customerId);
        if (c == null) {
            throw new Exception("cart not found");
        }
        c.getCartItems().clear();
        c.setProduct_quantity(0);
        float total = 0;
        for (CartItem ca : c.getCartItems()) {
            total += ca.getProduct().getPrice() * ca.getQuantity();
        }
        c.setTotal_price(total);
        return cRepo.save(c);

    }

    @Transactional
    public Cart increaseProductQuantity(Long customerId, Long productId)
            throws Exception {
        

        Product itemOpt = pRepo.findById(productId);
        if (itemOpt==null) {
            throw new Exception("Product not found!");
        }

        Cart cart;
        cart = cRepo.findByUserId(customerId);
        List<CartItem> itemList = cart.getCartItems();
        boolean flag = true;
        for (int i = 0; i < itemList.size(); i++) {
            CartItem element = itemList.get(i);
            if (element.getProduct().getId() == productId) {
//				cart.setProduct_quantity(cart.getProduct_quantity() + 1);
                cart.getCartItems().get(i).setQuantity(cart.getCartItems().get(i).getQuantity() + 1);
                flag = false;
            }
        }
        if (flag) {
            throw new Exception("Product not found in cart");
        }
        float total = 0;
        int totalQuantity = 0;
        for (CartItem c : itemList) {
            total += c.getProduct().getPrice() * c.getQuantity();
            totalQuantity += c.getQuantity();
        }
        cart.setTotal_price(total);
        cart.setProduct_quantity(totalQuantity);
        cRepo.save(cart);
        return cart;
    }

    @Transactional
    public Cart decreaseProductQuantity(Long customerId, Long productId)
            throws Exception {
        Optional<User> opt = crRepo.findById(customerId);
        if (opt.isEmpty()) {
            throw new Exception("Customer not found!");
        }

        Product itemOpt = pRepo.findById(productId);
        if (itemOpt==null) {
            throw new Exception("Product not found!");
        }

        Cart cart;
        cart = cRepo.findByUserId(customerId);
        List<CartItem> itemList = cart.getCartItems();
        boolean flag = true;
        if (itemList.size() > 0) {
            for (int i = 0; i < itemList.size(); i++) {
                CartItem element = itemList.get(i);
                if (element.getProduct().getId() == productId) {
//					cart.setProduct_quantity(cart.getProduct_quantity() - 1);
                    cart.getCartItems().get(i).setQuantity(element.getQuantity() - 1);
                    if (cart.getCartItems().get(i).getQuantity() == 0) {
                        itemList.remove(element);
                    }
                    flag = false;
                }
            }
        }

        if (flag) {
            throw new Exception("Product not found in cart");
        }
        float total = 0;
        int totalQuantity = 0;
        for (CartItem c : itemList) {
            total += c.getProduct().getPrice() * c.getQuantity();
            totalQuantity += c.getQuantity();
        }
        cart.setTotal_price(total);
        cart.setProduct_quantity(totalQuantity);
        cRepo.save(cart);
        return cart;
    }
}
