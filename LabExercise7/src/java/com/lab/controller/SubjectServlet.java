/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.lab.controller;

import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {
    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Session Verification
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect("login.html");
            return;
        }
        
        StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
        String matricNo = loggedUser.getMatricNo();
        String action = request.getParameter("action");

        if (action == null) { action = "view"; }

        switch (action) {
            case "add":
                SubjectBean newSub = new SubjectBean();
                newSub.setMatricNo(matricNo);
                newSub.setSubjectCode(request.getParameter("subjectCode"));
                newSub.setSubjectName(request.getParameter("subjectName"));
                subjectDAO.addSubject(newSub);
                response.sendRedirect("SubjectServlet?action=view");
                break;
                
            case "view":
                List<SubjectBean> list = subjectDAO.getSubjectsByMatric(matricNo);
                request.setAttribute("subjectList", list);
                request.getRequestDispatcher("subject/viewSubjects.jsp").forward(request, response);
                break;
                
            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                SubjectBean subToEdit = subjectDAO.getSubjectById(editId);
                request.setAttribute("subject", subToEdit);
                request.getRequestDispatcher("subject/updateSubject.jsp").forward(request, response);
                break;
                
            case "update":
                SubjectBean updateSub = new SubjectBean();
                updateSub.setId(Integer.parseInt(request.getParameter("id")));
                updateSub.setMatricNo(matricNo);
                updateSub.setSubjectCode(request.getParameter("subjectCode"));
                updateSub.setSubjectName(request.getParameter("subjectName"));
                subjectDAO.updateSubject(updateSub);
                response.sendRedirect("SubjectServlet?action=view");
                break;
                
            case "delete":
                int delId = Integer.parseInt(request.getParameter("id"));
                subjectDAO.deleteSubject(delId, matricNo);
                response.sendRedirect("SubjectServlet?action=view");
                break;
        }
    }
}