/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.validator.constraints.NotEmpty;

/**
 *
 * @author micic
 */
@Entity
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int customerId;

    @NotEmpty(message = "The customer name must not be empty")
    private String customerName;

    @NotEmpty(message = "The customer email must not be empty")
    private String customerEmail;
    private String customerPhone;

    @NotEmpty(message = "The customer username must not be empty")
    private String username;

    @NotEmpty(message = "The customer password must not be empty")
    private String password;

    private boolean enabled;

    @NotEmpty(message = "You must enter your street name")
    private String customerStreetName;

    @NotEmpty(message = "You must enter your city")
    private String customerCity;

    @NotEmpty(message = "You must enter your country")
    private String customerCountry;

    public Customer() {
    }

    public Customer(int customerId, String customerName, String customerEmail, String customerPhone, String username, String password, boolean enabled, String customerStreetName, String customerCity, String customerCountry) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.username = username;
        this.password = password;
        this.enabled = enabled;
        this.customerStreetName = customerStreetName;
        this.customerCity = customerCity;
        this.customerCountry = customerCountry;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getCustomerStreetName() {
        return customerStreetName;
    }

    public void setCustomerStreetName(String customerStreetName) {
        this.customerStreetName = customerStreetName;
    }

    public String getCustomerCity() {
        return customerCity;
    }

    public void setCustomerCity(String customerCity) {
        this.customerCity = customerCity;
    }

    public String getCustomerCountry() {
        return customerCountry;
    }

    public void setCustomerCountry(String customerCountry) {
        this.customerCountry = customerCountry;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerId=" + customerId + ", customerName=" + customerName + ", customerEmail=" + customerEmail + ", customerPhone=" + customerPhone + ", username=" + username + ", password=" + password + ", enabled=" + enabled + ", customerStreetName=" + customerStreetName + ", customerCity=" + customerCity + ", customerCountry=" + customerCountry + '}';
    }
}
