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
import com.petshop.model.Customer;
import java.util.List;
import org.hibernate.Query;

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

    @Override
    public List<Orders> getOrdersByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Orders where username = ?");
        query.setString(0, username);
        List<Orders> ordersList = query.list();

        return ordersList;
    }
}
