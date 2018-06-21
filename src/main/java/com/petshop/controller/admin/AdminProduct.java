/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.petshop.controller.admin;

import com.petshop.model.Product;

import com.petshop.service.ProductService;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Micic
 */
@Controller
@RequestMapping("/admin")
public class AdminProduct {

    private Path path;

    @Autowired
    private ProductService productService;

    @RequestMapping("/product/addProduct")
    public ModelAndView addProduct(ModelMap model, Product product) {

        model.addAttribute("product", new Product());

        return new ModelAndView("addProduct", "command", new Product());
    }

    @RequestMapping(value = "/product/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(@ModelAttribute("product") Product product, ModelAndView model,
            @RequestParam("file") MultipartFile file, HttpSession session) throws Exception {

        ServletContext context = session.getServletContext();
        String path = context.getInitParameter("upload.location");
        String filename = file.getOriginalFilename();

        byte[] bytes = file.getBytes();
        try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
                new File(path + File.separator + filename)))) {
            stream.write(bytes);
            stream.flush();
        }

        product.setProductImage("/PetShop/resources/images/" + filename);
        model.addObject("object", product);
        product.setProductId(productService.getCount() + 1);
        productService.addProduct(product);
        model.setViewName("redirect:/admin/productInventory");
        return model;

    }

    @RequestMapping("/product/editProduct/{id}")
    public String editProduct(@PathVariable("id") int id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);

        return "editProduct";
    }

    @RequestMapping(value = "/product/editProduct", method = RequestMethod.POST)
    public String editProductPost(@Valid @ModelAttribute("product") Product product, HttpSession session, 
            BindingResult result, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
            
        
        ServletContext context = session.getServletContext();
        String path = context.getInitParameter("upload.location");
        String filename = file.getOriginalFilename();

        byte[] bytes = file.getBytes();
        try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
                new File(path + File.separator + filename)))) {
            stream.write(bytes);
            stream.flush();
        }
        
        product.setProductImage("/PetShop/resources/images/" + filename);
        productService.editProduct(product);

        return "redirect:/admin/productInventory";
    }

    @RequestMapping("/product/deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id, Model model, HttpServletRequest request, 
                  HttpSession session) {
        Product product = productService.getProductById(id);
        
        if (product.getProductImage() != null){
            ServletContext context = session.getServletContext();
            String path = context.getInitParameter("upload.location");
            
            File file = new File(path.toString());
            try {
                if (file.exists()) {
                    file.delete();
                }
            } catch (Exception ex) {
                    ex.printStackTrace();
            }
        }
        

        
        productService.deleteProduct(product);

        return "redirect:/admin/productInventory";
    }
}
