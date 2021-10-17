package com.budev.controller;


import com.budev.model.Student;
import com.budev.model.allApplication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin_all_application_controller")
public class admin_all_application_controller extends HttpServlet {

    dbConnection db = new dbConnection();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String application_id = request.getParameter("application_id");
        String stu_id = request.getParameter("stu_id");

        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        myConn = db.getCon();
        ResultSet myRs = null;
        String result = "";

        allApplication newItem = new allApplication();
        Student stuItem = new Student();

        String select_sql = "select * from application_form_table where id = '" + application_id + "' ";

        try {
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(select_sql);
            boolean more = myRs.next();

            if (!more) {
                System.out.println("none");
            } else if (more) {

                String id = myRs.getString("id");
                String semester = myRs.getString("semester");
                String subject = myRs.getString("subject");
                String feeType = myRs.getString("feeType");
                String reason = myRs.getString("reason");
                String student_id = myRs.getString("student_id");

                System.out.println(id);
                String sql = "select * from student where s_Id = '" + student_id + "' ";
                stmt = myConn.createStatement();
                myRs = stmt.executeQuery(sql);
                boolean res = myRs.next();

                if (res) {
                    stuItem.setS_name(myRs.getString("s_Name"));
                    stuItem.setS_department(myRs.getString("s_Department"));
                    stuItem.setS_roll(myRs.getString("s_Roll"));
                } else {
                    System.out.println("student err");
                }

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setSubject(subject);
                newItem.setFeeType(feeType);
                newItem.setReason(reason);
                newItem.setStudent_id(student_id);

                System.out.println(newItem.getId());

                //// PrintWriter out = response.getWriter();
                request.setAttribute("newItem", newItem);
                request.setAttribute("stuItem", stuItem);

                request.getRequestDispatcher("admin_preview_application.jsp").forward(request, response);

                // response.sendRedirect("admin_preview_application.jsp");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
