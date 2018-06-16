/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.service.impl;

import com.petshop.dao.OrdersDetailDao;
import com.petshop.model.OrdersDetail;
import com.petshop.service.OrdersDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Micic
 */
@Service
public class OrdersDetailServiceImpl implements OrdersDetailService {

    @Autowired
    private OrdersDetailDao ordersDetailDao;
    
    @Override
    public void addOrdersDetail(OrdersDetail ordersDetail) {
        ordersDetailDao.addOrdersDetail(ordersDetail);
    }
}
