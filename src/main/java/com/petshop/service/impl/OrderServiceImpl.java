/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.service.impl;

import com.petshop.model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.petshop.dao.OrdersDao;
import com.petshop.service.OrdersService;
import java.util.List;

/**
 *
 * @author Micic
 */
@Service
public class OrderServiceImpl implements OrdersService{

    @Autowired
    private OrdersDao orderDao;
    
    @Override
    public Orders addOrders(Orders orders) {
        return orderDao.addOrders(orders);
    }

    @Override
    public List<Orders> getOrdersByUsername(String username) {
        return orderDao.getOrdersByUsername(username);
    }
}
