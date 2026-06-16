package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Model.SessionBean;

public class SessionDAO {
    Connection connection = null;
    private String jdbcURL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";
    
    private static final String INSERT_TRAINING_SESSIONS_SQL = "INSERT INTO training_session (student_name, branch_location, status) VALUES " + " (?, ?, ?);";
    private static final String SELECT_TRAINING_SESSIONS_BY_STUDENT_ID = "select session_id,student_name,branch_location,status from training_session where id =?";
    private static final String SELECT_ALL_TRAINING_SESSIONS = "select * from training_session";
    private static final String DELETE_TRAINING_SESSIONS_SQL = "delete from training_session where id = ?;";
    private static final String UPDATE_TRAINING_SESSIONS_SQL = "update training_session set student_name = ?,branch_location= ?, status =? where id = ?;";
    
    public SessionDAO() {}
        protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
        
    public void insertTraining_session(SessionBean sessionBean) throws SQLException {
        System.out.println(INSERT_TRAINING_SESSIONS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.
            prepareStatement(INSERT_TRAINING_SESSIONS_SQL)) {
            preparedStatement.setString(1, sessionBean.getStudent_name());
            preparedStatement.setString(2, sessionBean.getBranch_location());
            preparedStatement.setString(3, sessionBean.getStatus());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public SessionBean selectTraining_session(int session_id) {
        SessionBean training_session = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.
            prepareStatement(SELECT_TRAINING_SESSIONS_BY_STUDENT_ID);) {
            preparedStatement.setInt(1, session_id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String student_name = rs.getString("student_name");
                String branch_location = rs.getString("branch_location");
                String status = rs.getString("status");
                training_session = new SessionBean(session_id, student_name, branch_location, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return training_session;
    }
    public List < SessionBean > selectAllTraining_session() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List < SessionBean > training_session = new ArrayList < > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2: Create a statement using connection object
            PreparedStatement preparedStatement = connection.
            prepareStatement(SELECT_ALL_TRAINING_SESSIONS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();
            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int session_id = rs.getInt("session_id");
                String student_name = rs.getString("student_name");
                String branch_location = rs.getString("branch_location");
                String status = rs.getString("status");
                training_session.add(new SessionBean(session_id, student_name, branch_location, status));
            }
        }catch (SQLException e) {
            printSQLException(e);
        }
        return training_session;
    }

    public boolean deleteTraining_session(int session_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
        PreparedStatement statement = connection.
        prepareStatement(DELETE_TRAINING_SESSIONS_SQL);) {
        statement.setInt(1, session_id);
        rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public boolean updateTraining_session(SessionBean sessionBean) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
        PreparedStatement statement = connection.
        prepareStatement(UPDATE_TRAINING_SESSIONS_SQL);) {
            statement.setString(1, sessionBean.getStudent_name());
            statement.setString(2, sessionBean.getBranch_location());
            statement.setString(3, sessionBean.getStatus());
            statement.setInt(4, sessionBean.getSession_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

        
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException)
                e).getSQLState());
                System.err.println("Error Code: " + ((SQLException)
                e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


}
