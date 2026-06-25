/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import java.util.List;
import com.lab.dao.ProductDAO;
import com.lab.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        List<Product> listProduct = productDAO.selectAllProducts();
        
        out.println("<h2>Product Inventory</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Category</th><th>Price (RM)</th><th>Quantity</th><th>Actions</th></tr>");
        
        for (Product product : listProduct) {
            out.println("<tr>");
            out.println("<td>" + product.getId() + "</td>");
            out.println("<td>" + product.getName() + "</td>");
            out.println("<td>" + product.getCategory() + "</td>");
            out.println("<td>" + product.getPrice() + "</td>");
            out.println("<td>" + product.getQuantity() + "</td>");
            out.println("<td><a href='UpdateProductServlet?id=" + product.getId() + "'>Edit</a> | ");
            out.println("<a href='DeleteProductServlet?id=" + product.getId() + "'>Delete</a></td>");
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("<br><a href='add_product.html'>Add New Product</a>");
    }
}
