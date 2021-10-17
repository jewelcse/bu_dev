package com.budev.controller;



import com.budev.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutController")
public class logoutController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {

        try {

            Student logoutStu = new Student();
            logoutStu.removeStudentRoll();
            logoutStu.removeStudentReg();
            logoutStu.removeStudentName();
            logoutStu.removeStudentFname();
            logoutStu.removeStudentMname();
            logoutStu.removeStudentEmail();
            logoutStu.removeStudentDepartment();
            logoutStu.removeStudentFaculty();
            logoutStu.removeStudentSemester();
            logoutStu.removeStudentPhone();
            HttpSession session = request.getSession(false);
            session.removeAttribute("currentSessionStudent");
            session.invalidate();
            response.sendRedirect("index.jsp?successfully-logout");
            System.out.print("log-out");
        } catch (Throwable theException) {
            System.out.println(theException);
        }
    }


}
