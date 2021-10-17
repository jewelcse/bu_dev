package com.budev.controller;



import com.budev.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Random;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/TestCSVServlet")
public class TestCSVServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String uploadURL = "assets";
    dbConnection db = new dbConnection();

    public TestCSVServlet() {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part part = request.getPart("chooser");
        String fileName = getFileName(part);
        String appilicationPath = request.getServletContext().getRealPath("");
        String basePath = appilicationPath + File.separator + uploadURL;
        String csvPath = basePath + File.separator + fileName;
        File fileSaveDir = new File(csvPath);
        part.write(csvPath + File.separator);

        BufferedReader bufferedReader = new BufferedReader(new FileReader(csvPath));

        String line = "";

        while ((line = bufferedReader.readLine()) != null) {
            String[] result = line.trim().split(",");


            //System.out.println(result);
            String roll = result[0];
            String reg = result[1];
            String name = result[2];
            String father_name = result[3];
            String mother_name = result[4];
            String email = result[5];
            String phone = result[6];
            String semester = result[7];
            String department = result[8];
            String faculty = result[9];

            System.out.println(roll + " " + reg + " "+ name + " " + father_name + " " + mother_name + " " + email + " "+
                    phone + " " + semester + " " + department + " " + faculty);

            Random rand = new Random();
            Integer min = 1000;
            Integer max = 10000;
            Integer rand_int1 = rand.nextInt((max - min) + 1) + min;
            String password = String.valueOf(rand_int1);




            dbConnection db = new dbConnection();
            Student newStudent = new Student(roll, reg, name, father_name, mother_name, email, phone, password, semester, department, faculty);
            System.out.println("Students file is inserting..........");


            try {
                mainController.addStudent(newStudent);


            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

    }


    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }


}
