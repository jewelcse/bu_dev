package com.budev.controller;


import com.budev.model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/adminLogout")
public class adminLogout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            Admin logoutAdmin = new Admin();

            HttpSession session = request.getSession(true);


            if (session.getAttribute("currentSessionForSuperAdmin") != null) {


                HttpSession session1 = request.getSession(false);
                session1.removeAttribute("currentSessionForSuperAdmin");

                session1.invalidate();
                response.sendRedirect("admin-login.jsp");
                System.out.print("super-admin-log-out");

            } else if (session.getAttribute("currentSessionForSubAdmin") != null) {

                HttpSession session2 = request.getSession(false);
                session2.removeAttribute("currentSessionForSubAdmin");
                session2.invalidate();
                response.sendRedirect("admin-login.jsp");
                System.out.print("sub-admin-log-out");


            } else {
                response.sendRedirect("admin-login.jsp"); //error page

            }


        } catch (Throwable theException) {
            System.out.println(theException);
        }


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

}
