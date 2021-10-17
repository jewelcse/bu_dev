package com.budev.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/SubAdminServletController")
public class SubAdminServletController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("update_data_type");
        String adminId = request.getParameter("sub_admin_id");
        String value = request.getParameter("value");
        System.out.println(type + " " + adminId + "------>" + value);

        PrintWriter out = response.getWriter();
        if (type.equals("update_development_fee")) {
            String col = "update_development_fee";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }

        } else if (type.equals("students_info")) {
            String col = "student_information";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission Denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }
        } else if (type.equals("application_letters")) {
            String col = "application_letters";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission Denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }
        } else if (type.equals("development_fees_table_update")) {
            String col = "update_development_fees_table";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission Denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }
        } else if (type.equals("semester_fees_table_update")) {
            String col = "update_semester_fees_table";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission Denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }
        } else if (type.equals("formfillup_fees_table_update")) {
            String col = "update_formfillup_fees_table";
            if (mainController.havePermission(col, adminId)) {
                mainController.deniedPermission(col, adminId);
                out.write("Permission Denied!");
            } else {
                mainController.makePermission(col, adminId);
                out.write("Accessed permission");
            }
        }
    }

}
