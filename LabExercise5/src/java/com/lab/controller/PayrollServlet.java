/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.Employee;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PayrollServlet", urlPatterns = {"/PayrollServlet"})
public class PayrollServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Create a list to hold employee objects
        List<Employee> list = new ArrayList<>();

        // 1. Create and populate at least 5 Employee objects
        Employee emp1 = new Employee();
        emp1.setEmpId("EMP01"); emp1.setName("Ahmad Ali"); emp1.setDepartment("IT"); emp1.setBasicSalary(3500.0);

        Employee emp2 = new Employee();
        emp2.setEmpId("EMP02"); emp2.setName("Siti Aminah"); emp2.setDepartment("HR"); emp2.setBasicSalary(2800.0);

        Employee emp3 = new Employee();
        emp3.setEmpId("EMP03"); emp3.setName("Muthusamy"); emp3.setDepartment("Finance"); emp3.setBasicSalary(4200.0);

        Employee emp4 = new Employee();
        emp4.setEmpId("EMP04"); emp4.setName("Jane Doe"); emp4.setDepartment("Marketing"); emp4.setBasicSalary(2900.0);

        Employee emp5 = new Employee();
        emp5.setEmpId("EMP05"); emp5.setName("John Smith"); emp5.setDepartment("IT"); emp5.setBasicSalary(3000.0);

        // Add them to the list
        list.add(emp1);
        list.add(emp2);
        list.add(emp3);
        list.add(emp4);
        list.add(emp5);

        // 2. Share data with JSP
        request.setAttribute("employeeList", list);

        // 3. Forward to View
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }
}