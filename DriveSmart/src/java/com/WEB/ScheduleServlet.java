package com.WEB;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.SessionDAO;
import com.Model.SessionBean;

@WebServlet("/")
public class ScheduleServlet extends HttpServlet {

    private SessionDAO sessionDAO;
    
    public void init() {
        sessionDAO = new SessionDAO();
}
    protected void doPost(HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
            case "/insert":
                insertTraining_session(request, response);
                break;
            case "/delete":
                deleteTraining_session(request, response);
                break;
            case "/edit":
                showEditForm(request, response);
                break;
            case "/update":
                updateTraining_session(request, response);
                break;
            default:
                listTraining_session(request, response);
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void listTraining_session(HttpServletRequest request,
    HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List < SessionBean > training_session;
        training_session = sessionDAO.selectAllTraining_session();
        request.setAttribute("listTraining_session", training_session);
        RequestDispatcher dispatcher =
        request.getRequestDispatcher("training_sessionList.jsp");
        dispatcher.forward(request, response);
    }         
    
    private void showNewForm(HttpServletRequest request,
    HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher =
        request.getRequestDispatcher("training_sessionForm.jsp");
        dispatcher.forward(request, response);
    }
                       
    private void showEditForm(HttpServletRequest request,
    HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int session_id = Integer.parseInt(request.getParameter("session_id"));
        SessionBean existingTraining_session = sessionDAO.selectTraining_session(session_id);
        RequestDispatcher dispatcher =
        request.getRequestDispatcher("TrainingSessionFormForm.jsp");
        request.setAttribute("training_session", existingTraining_session);
        dispatcher.forward(request, response);
    }
              
    private void insertTraining_session(HttpServletRequest request,
    HttpServletResponse response)
    throws SQLException, IOException {
        String student_name = request.getParameter("student_name");
        String branch_location = request.getParameter("branch_location");
        String status = request.getParameter("status");
        SessionBean newtraning_session = new SessionBean(student_name, branch_location, status);
        sessionDAO.insertTraining_session(newtraning_session);
        response.sendRedirect("list");
    }
    
    private void updateTraining_session(HttpServletRequest request,
    HttpServletResponse response)
    throws SQLException, IOException {
        int session_id = Integer.parseInt(request.getParameter("session_id"));
        String student_name = request.getParameter("student_name");
        String branch_location = request.getParameter("branch_location");
        String status = request.getParameter("status");
        SessionBean newtraning_session = new SessionBean(session_id, student_name, branch_location, status);
        sessionDAO.updateTraining_session(newtraning_session);
        response.sendRedirect("list");
    }
    
    private void deleteTraining_session(HttpServletRequest request,
    HttpServletResponse response)
    throws SQLException, IOException {
        int session_id = Integer.parseInt(request.getParameter("session_id"));
        sessionDAO.deleteTraining_session(session_id);
        response.sendRedirect("list");
    }
}
