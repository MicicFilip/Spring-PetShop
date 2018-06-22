/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.controller.admin;

import com.petshop.model.Customer;
import com.petshop.model.Orders;
import com.petshop.model.OrdersDetail;
import com.petshop.model.Product;
import com.petshop.service.CustomerService;
import com.petshop.service.OrdersDetailService;
import com.petshop.service.OrdersService;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author micic
 */
@Controller
@RequestMapping("/admin")
public class AdminUsers {
    
    @Autowired
    private CustomerService customerService;
    
    @Autowired
    private OrdersService ordersService;
    
    @Autowired
    private OrdersDetailService ordersDetailService;
    
    @RequestMapping("/customer/view/{id}")
    public String viewCustomer(@PathVariable int id, Model model) throws IOException {
        Customer customer = customerService.getCustomerById(id);
        model.addAttribute("customer", customer);
        
        List<Orders> customerOrders = ordersService.getOrdersByUsername(customer.getUsername());
        model.addAttribute("customerOrders", customerOrders);
        
        return "viewCustomer";
    }
    
    @RequestMapping("/customer/view/order/{id}")
    public String viewCustomerOrder(@PathVariable int id, Model model) throws IOException {
        List<OrdersDetail> ordersDetails = ordersDetailService.getOrdersById(id);
        model.addAttribute("ordersDetails", ordersDetails);
       
        return "viewOrder";
    }
    
    @RequestMapping("/customer/ban/{username}")
    public String banUser(@PathVariable String username, Model model, HttpServletRequest req) {
        customerService.banCustomer(username);
        return "redirect:/admin/customer";
    }
    
    @RequestMapping("/customer/unban/{username}")
    public String unbanUser(@PathVariable String username, Model model, HttpServletRequest req) {
        customerService.unbanCustomer(username);
        return "redirect:/admin/customer";
    }
}
