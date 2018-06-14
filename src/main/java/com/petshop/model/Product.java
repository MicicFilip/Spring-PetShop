/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;
import javax.persistence.*;
import javax.validation.constraints.Min;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Micic
 */
@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "productId")
    private int productId;

    @NotEmpty(message = "The product name must not be empty")
    @Column(name = "productName")
    private String productName;

    @Column(name = "productDescription")
    private String productDescription;

    @Column(name = "productCategory")
    private String productCategory;

    @Min(value = 0, message = "The product price must not be less then zero")
    @Column(name = "productPrice")
    private double productPrice;

    @Column(name = "productStatus")
    private String productStatus;

    @Min(value = 0, message = "The product unit must not be less then zero")
    @Column(name = "unitInStock")
    private int unitInStock;

    @Column(name = "productManufacturer")
    private String productManufacturer;

    @Column(name = "productImage")
    private String productImage;

//    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    @JsonIgnore
//    private List<CartItem> cartItemList;
    public Product() {
    }

    public Product(int productId, String productCategory, String productName, String productDescription, double productPrice, String productStatus, int unitInStock, String productManufacturer, String productImage) {
        this.productId = productId;
        this.productCategory = productCategory;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPrice = productPrice;
        this.productStatus = productStatus;
        this.unitInStock = unitInStock;
        this.productManufacturer = productManufacturer;
        this.productImage = productImage;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public int getUnitInStock() {
        return unitInStock;
    }

    public void setUnitInStock(int unitInStock) {
        this.unitInStock = unitInStock;
    }

    public String getProductManufacturer() {
        return productManufacturer;
    }

    public void setProductManufacturer(String productManufacturer) {
        this.productManufacturer = productManufacturer;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productCategory=" + productCategory + ", productName=" + productName + ", productDescription=" + productDescription + ", productPrice=" + productPrice + ", productStatus=" + productStatus + ", unitInStock=" + unitInStock + ", productManufacturer=" + productManufacturer + ", productImage=" + productImage + '}';
    }

}
