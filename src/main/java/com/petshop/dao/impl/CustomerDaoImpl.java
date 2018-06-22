/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.dao.impl;

import com.petshop.dao.CustomerDao;
import com.petshop.model.Authorities;
import com.petshop.model.Customer;
import com.petshop.model.Users;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author micic
 */
@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    //crated setter for the session
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //crated getter for the session
    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void registerCustomer(Customer customer) {
        Session session = sessionFactory.getCurrentSession();
        
        // Bcrypt hashing methods called in setPassword
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        
        Users newUser = new Users();

        String customerPassword = customer.getPassword();
        String hashedPassword = passwordEncoder.encode(customerPassword);
        
        newUser.setUsername(customer.getUsername());
        customer.setPassword(hashedPassword);
        newUser.setPassword(hashedPassword);
        newUser.setEnabled(true);
        
        Authorities newAuthorities = new Authorities();
        newAuthorities.setUsername(customer.getUsername());
        newAuthorities.setAuthority("ROLE_USER");

        session.saveOrUpdate(newUser);
        session.saveOrUpdate(newAuthorities);
        
        session.saveOrUpdate(customer);

        session.flush();
    }

    @Override
    public Customer getCustomerById(int customerId) {
        Session session = sessionFactory.getCurrentSession();
        return (Customer) session.get(Customer.class, customerId);
    }
    
    @Override
    public int banCustomer(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("UPDATE users SET enabled = :enabled " + "WHERE username = :username");
        query.setParameter("enabled", 0);
        query.setParameter("username", username);
        int result = query.executeUpdate();
        return result;
    }

    @Override
    public int unbanCustomer(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("UPDATE users SET enabled = :enabled " + "WHERE username = :username");
        query.setParameter("enabled", 1);
        query.setParameter("username", username);
        int result = query.executeUpdate();

        return result;
    }

    @Override
    public List<Customer> getAllCustomers() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer");
        List<Customer> customerList = query.list();

        return customerList;
    }
    
    @Override
    public List<Users> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users");
        List<Users> usersList = query.list();

        return usersList;
    }

    @Override
    public Customer getCustomerByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Customer where username = ?");
        query.setString(0, username);

        return (Customer) query.uniqueResult();
    }

    @Override
    public Customer find(String username) {
        return (Customer) sessionFactory.getCurrentSession().get(Customer.class, username);
    }
    
}
