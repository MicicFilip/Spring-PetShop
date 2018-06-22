/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.service.impl;

import com.petshop.dao.CustomerDao;
import com.petshop.model.Customer;
import com.petshop.model.Users;
import com.petshop.service.CustomerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author micic
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    
    @Autowired
    private CustomerDao customerDao;

    @Override
    public void registerCustomer(Customer customer) {
        customerDao.registerCustomer(customer);
    }

    @Override
    public Customer getCustomerById(int customerId) {
        return customerDao.getCustomerById(customerId);
    }

    @Override
    public int banCustomer(String username) {
        return customerDao.banCustomer(username);
    }

    @Override
    public int unbanCustomer(String username) {
        return customerDao.unbanCustomer(username);
    }
    
    @Override
    public List<Customer> getAllCustomers() {
        return customerDao.getAllCustomers();
    }

    @Override
    public List<Users> getAllUsers() {
        return customerDao.getAllUsers();
    }
    
    @Override
    public Customer getCustomerByUsername(String username) {
        return customerDao.getCustomerByUsername(username);
    }

    @Override
    public Customer find(String username) {
        return customerDao.find(username);
    }
}
