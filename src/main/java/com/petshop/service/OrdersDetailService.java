/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.service;

import com.petshop.model.OrdersDetail;
import java.util.List;

/**
 *
 * @author Filip
 */
public interface OrdersDetailService {

    public void addOrdersDetail(OrdersDetail ordersDetail);
    
    public List<OrdersDetail> getOrdersById(int id);
    
}
