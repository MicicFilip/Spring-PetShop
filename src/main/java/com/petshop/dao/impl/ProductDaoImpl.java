/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.dao.impl;

import com.petshop.dao.ProductDao;
import com.petshop.model.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Micic
 */
@Repository
@Transactional
public class ProductDaoImpl implements ProductDao {

    @Autowired
    private SessionFactory sessionFactory;

    //kreiramo geter za sesiju
    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Product> getProductList() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Product");
        List<Product> productList = query.list();
        session.flush();

        return productList;
    }

    @Override
    public Product getProductById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = (Product) session.get(Product.class, id);
        session.flush();

        return product;
    }

    @Override
    public Product addProduct(Product product) {
        return (Product) getSession().merge(product);
    }

    @Override
    public void editProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(product);
        session.flush();
    }

    @Override
    public void deleteProduct(Product product) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(product);
        session.flush();
    }

    @Override
    public int getCount() {
        Number result = (Number) getSession().createSQLQuery("SELECT COUNT(*) FROM product").uniqueResult();
        return Integer.parseInt(result.toString());
    }

}
