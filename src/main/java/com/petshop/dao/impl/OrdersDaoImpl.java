/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.dao.impl;

import com.petshop.model.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.petshop.dao.OrdersDao;

/**
 *
 * @author Micic
 */
@Repository
@Transactional
public class OrdersDaoImpl implements OrdersDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Orders addOrders(Orders orders) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(orders);
        session.flush();
        return orders;

    }
}
