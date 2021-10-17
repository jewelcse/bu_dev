package com.budev.controller;



import com.budev.Dao.adminStudentDao;
import com.budev.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet("/adminShowStudentsController")
public class adminShowStudentsController extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int stpage = Integer.parseInt(page);
        int total = 6;
        if (stpage == 1) {
        } else {
            stpage = stpage - 1;
            stpage = stpage * total + 1;
        }

        ArrayList<Student> list = adminStudentDao.showData(stpage, total);

        PrintWriter out = response.getWriter();

        //out.println(list);

        request.setAttribute("list_student", list);

        RequestDispatcher view = request.getRequestDispatcher("admin_show_all_student.jsp");
        view.forward(request, response);


    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

}
