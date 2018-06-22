/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.dao.impl;

import com.petshop.dao.OrdersDetailDao;
import com.petshop.model.OrdersDetail;
import com.petshop.model.Product;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Filip
 */
@Repository
@Transactional
public class OrdersDetailDaoImpl implements OrdersDetailDao {

    @Autowired
    private SessionFactory sessionFactory;
    
    @Override
    public void addOrdersDetail(OrdersDetail ordersDetail) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(ordersDetail);
        session.flush();
    }
    
    @Override
    public List<OrdersDetail> getOrdersById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from OrdersDetail where ordersId = ?");
        query.setInteger(0, id);
        List<OrdersDetail> ordersList = query.list();
        
        return ordersList;
    }
}
