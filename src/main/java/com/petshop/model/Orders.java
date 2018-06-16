/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Micic
 */
@Entity
public class Orders {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ordersId;

    private String username;

    private String ordersName;

    private Date dateCreation;

    public Orders() {
    }

    public Orders(int ordersId, String username, String ordersName, Date dateCreation) {
        this.ordersId = ordersId;
        this.username = username;
        this.ordersName = ordersName;
        this.dateCreation = dateCreation;
    }

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOrdersName() {
        return ordersName;
    }

    public void setOrdersName(String ordersName) {
        this.ordersName = ordersName;
    }

    public Date getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Date dateCreation) {
        this.dateCreation = dateCreation;
    }

    @Override
    public String toString() {
        return "Orders{" + "ordersId=" + ordersId + ", username=" + username + ", ordersName=" + ordersName + ", dateCreation=" + dateCreation + '}';
    }
}
