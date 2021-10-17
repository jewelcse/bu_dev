package com.budev.controller;



import com.budev.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/logInController")
public class logInController extends HttpServlet {

    static dbConnection db = new dbConnection();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("student_id");
        String password = request.getParameter("password");

        System.out.println(id + " " + password);

        Student login_student = new Student();
        login_student.setS_roll(id);
        login_student.setS_password(password);

        login_student = mainController.login(login_student);
        if (login_student.isValid()) {

            HttpSession session = request.getSession(true);
            session.setAttribute("currentSessionStudent", login_student);

            String pagename = (String) session.getAttribute("current_page");

            if (pagename == null) {
                response.sendRedirect("index.jsp?user=id.login-successfully"); //logged-in page
            } else if (pagename.equals("payment.jsp")) {


                response.sendRedirect(pagename);


            } else {


                // response.sendRedirect(pagename);

            }
        } else
            response.sendRedirect("login.jsp?failed-login"); //error page


    }

}
