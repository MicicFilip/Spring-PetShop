/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.dao;

import com.petshop.model.Orders;
import java.util.List;

/**
 *
 * @author Micic
 */
public interface OrdersDao {
    
    public Orders addOrders(Orders orders);
    
    public List<Orders> getOrdersByUsername(String username);
}
