package com.lab.controller;

import com.lab.bean.Employee;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PayrollServlet")
public class payrollServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Employee> list = new ArrayList<>();
        
        // Populate with 5 different Employee objects [cite: 463]
        Employee e1 = new Employee(); e1.setEmpId("E001"); e1.setName("Ahmad"); e1.setDepartment("IT"); e1.setBasicSalary(4500.0);
        Employee e2 = new Employee(); e2.setEmpId("E002"); e2.setName("Siti"); e2.setDepartment("HR"); e2.setBasicSalary(2800.0);
        Employee e3 = new Employee(); e3.setEmpId("E003"); e3.setName("John"); e3.setDepartment("Finance"); e3.setBasicSalary(3500.0);
        Employee e4 = new Employee(); e4.setEmpId("E004"); e4.setName("Ravi"); e4.setDepartment("Marketing"); e4.setBasicSalary(2900.0);
        Employee e5 = new Employee(); e5.setEmpId("E005"); e5.setName("Mei"); e5.setDepartment("Sales"); e5.setBasicSalary(5000.0);
        
        list.add(e1); list.add(e2); list.add(e3); list.add(e4); list.add(e5);

        // Share data with JSP [cite: 464]
        request.setAttribute("employeeList", list);
        
        // Forward to View [cite: 465]
        RequestDispatcher rd = request.getRequestDispatcher("payroll_view.jsp");
        rd.forward(request, response);
    }
}