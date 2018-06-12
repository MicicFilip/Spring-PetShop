/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.controller;

import com.petshop.model.Customer;
import com.petshop.service.CustomerService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author micic
 */
@Controller
public class MainController {
    
    @Autowired
    private CustomerService customerService;
    
    @RequestMapping("/")
    public String index() {
        return "index";
    }
    
    @RequestMapping("/register")
    public String register(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);

        return "register";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "registerCustomer";
        }

        List<Customer> customerList = customerService.getAllCustomers();

        for (int i = 0; i < customerList.size(); i++) {
            if (customer.getCustomerEmail().equals(customerList.get(i).getCustomerEmail())) {
                model.addAttribute("emailErrorMessage", "Email already exists");

                return "register";
            }

            if (customer.getUsername().equals(customerList.get(i).getUsername())) {
                model.addAttribute("usernameErrorMessage", "Username already exists");

                return "register";
            }
        }

        customer.setEnabled(true);
        customerService.registerCustomer(customer);
        return "registerSuccess";
    }
    
    @RequestMapping("/login")
    public String login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {

        if (error != null) {
            model.addAttribute("error", "Invalid username and password");
        }

        if (logout != null) {
            model.addAttribute("msg", "You have been logged out successfully");
        }

        return "login";
    }
}
