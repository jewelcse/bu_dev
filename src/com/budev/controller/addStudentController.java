package com.budev.controller;

import com.budev.model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;


@WebServlet("/addStudentController")
public class addStudentController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String roll = request.getParameter("s_roll");
        String reg = request.getParameter("s_reg");
        String name = request.getParameter("s_name");
        String mother_name = request.getParameter("s_mother_name");
        String father_name = request.getParameter("s_father_name");
        String email = request.getParameter("s_email");
        String faculty = request.getParameter("s_faculty");
        String department = request.getParameter("s_department");
        String semester = request.getParameter("s_semester");
        String phone = request.getParameter("s_phone");

//		System.out.print(roll);
        // Generate random password in range 0 to 999
        Random rand = new Random();
        Integer min = 1000;
        Integer max = 10000;
        Integer rand_int1 = rand.nextInt((max - min) + 1) + min;
        String password = String.valueOf(rand_int1);


        Student newStudent = new Student(roll, reg, name, father_name, mother_name, email, phone, password, semester, department, faculty);

        try {
            mainController.addStudent(newStudent);
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_add_student.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
