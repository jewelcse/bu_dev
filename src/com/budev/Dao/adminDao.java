package com.budev.Dao;



import com.budev.controller.dbConnection;
import com.budev.model.Admin;
import com.budev.model.Department;
import com.budev.model.allApplication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class adminDao {

    public static ArrayList<Admin> showAllSubAdmin() {

        dbConnection db = new dbConnection();
        ArrayList<Admin> adminList = new ArrayList<Admin>();

        String sql = "select * from  sub_admin ORDER BY id DESC ";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {
                Admin newAdmin = new Admin();
                String id = myRs.getString("id");
                String name = myRs.getString("name");
                String password = myRs.getString("password");
                String item1 = myRs.getString("update_development_fee");
                String item2 = myRs.getString("student_information");
                String item3 = myRs.getString("application_letters");
                String item4 = myRs.getString("update_development_fees_table");
                String item5 = myRs.getString("update_semester_fees_table");
                String item6 = myRs.getString("update_formfillup_fees_table");

                newAdmin.setId(id);
                newAdmin.setName(name);
                newAdmin.setPassword(password);
                newAdmin.setItem1(item1);
                newAdmin.setItem2(item2);
                newAdmin.setItem3(item3);
                newAdmin.setItem4(item4);
                newAdmin.setItem5(item5);
                newAdmin.setItem6(item6);
                adminList.add(newAdmin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminList;
    }

    public static Admin getSubAdminById(String id) {

        dbConnection db = new dbConnection();
        Admin login_admin = new Admin();

        String sql = "select * from sub_admin where id = '" + id + "'";

        try {
            Connection con = db.getCon();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {

                login_admin.setId(myRs.getString("id"));
                login_admin.setName(myRs.getString("name"));
                login_admin.setItem1(myRs.getString("update_development_fee"));
                login_admin.setItem2(myRs.getString("student_information"));
                login_admin.setItem3(myRs.getString("application_letters"));
                login_admin.setItem4(myRs.getString("update_development_fees_table"));
                login_admin.setItem5(myRs.getString("update_semester_fees_table"));
                login_admin.setItem6(myRs.getString("update_formfillup_fees_table"));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return login_admin;

    }

    public static ArrayList<allApplication> showAllApplicationForm() {
        dbConnection db = new dbConnection();
        ArrayList<allApplication> applicationList = new ArrayList<allApplication>();
        String sql = "select * from  application_form_table ORDER BY id DESC ";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {

                allApplication newItem = new allApplication();

                String id = myRs.getString("id");
                String semester = myRs.getString("semester");
                String subject = myRs.getString("subject");
                String feeType = myRs.getString("feeType");
                String reason = myRs.getString("reason");
                String student_id = myRs.getString("student_id");
                String dept = myRs.getString("department");

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setSubject(subject);
                newItem.setFeeType(feeType);
                newItem.setReason(reason);
                newItem.setStudent_id(student_id);
                newItem.setDept(dept);
                applicationList.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicationList;
    }

    public static ArrayList<Department> getAllDepartment() {
        dbConnection db = new dbConnection();
        ArrayList<Department> deptList = new ArrayList<Department>();
        String sql = "select * from  department";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {

                Department newItem = new Department();

                String id = myRs.getString("id");
                String dept = myRs.getString("dept_name");

                newItem.setDeptId(id);
                newItem.setDeptName(dept);

                deptList.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deptList;
    }

}
