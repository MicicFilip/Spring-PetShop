/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.model;

/**
 *
 * @author Micic
 */
public class Item {

    private Product product;
    private int qunatity;

    public Item(){
        super();
    }
    
    public Item(Product product, int qunatity) {
        super();
        this.product = product;
        this.qunatity = qunatity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQunatity() {
        return qunatity;
    }

    public void setQunatity(int qunatity) {
        this.qunatity = qunatity;
    }

}
