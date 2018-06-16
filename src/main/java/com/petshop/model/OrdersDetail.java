/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Filip
 */
@Entity
public class OrdersDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ordersDetailId;

    private int productId;

    private int ordersId;

    private double price;

    private int quantity;

    public OrdersDetail() {
    }

    public OrdersDetail(int ordersDetailId, int productId, int ordersId, double price, int quantity) {
        this.ordersDetailId = ordersDetailId;
        this.productId = productId;
        this.ordersId = ordersId;
        this.price = price;
        this.quantity = quantity;
    }

    public int getOrdersDetailId() {
        return ordersDetailId;
    }

    public void setOrdersDetailId(int ordersDetailId) {
        this.ordersDetailId = ordersDetailId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrdersDetails{" + "ordersDetailId=" + ordersDetailId + ", productId=" + productId + ", ordersId=" + ordersId + ", price=" + price + ", quantity=" + quantity + '}';
    }

}
