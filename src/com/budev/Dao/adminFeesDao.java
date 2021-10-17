package com.budev.Dao;

import com.budev.controller.dbConnection;
import com.budev.controller.mainController;
import com.budev.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class adminFeesDao {

    public static ArrayList<adminDevelopmentFeesTable> showAllDevelopmentFees(int start, int total) {
        dbConnection db = new dbConnection();
        ArrayList<adminDevelopmentFeesTable> developmentfee = new ArrayList<adminDevelopmentFeesTable>();
        String sql = "select * from admin_development_fees_table limit " + (start - 1) + "," + total;
        try {
            Connection con = db.getCon();
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            while (myRs.next()) {
                adminDevelopmentFeesTable newItem = new adminDevelopmentFeesTable();

                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String main_fee = myRs.getString("main_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setDepartment(dept.getDeptName());
                newItem.setMain_fee(main_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
                developmentfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return developmentfee;
    }

    public static adminDevelopmentFeesTable getDevelopmentFeeById(String newId) {

        dbConnection db = new dbConnection();

        String sql = "select * from  admin_development_fees_table where id = '" + newId + "'";
        Connection con = db.getCon();
        adminDevelopmentFeesTable newItem = new adminDevelopmentFeesTable();

        try {
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            System.out.print(myRs);
            while (myRs.next()) {
                // Integer newid = Integer.parseInt(myRs.getString("id"));

                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String main_fee = myRs.getString("main_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setDepartment(dept.getDeptName());
                newItem.setMain_fee(main_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newItem;

    }

    public static ArrayList<ChangedFees> showAllChangedFees() {

        dbConnection db = new dbConnection();
        ArrayList<ChangedFees> changedDevelopmentfee = new ArrayList<ChangedFees>();
        String sql = "select * from  changed_development_fee order by id desc";

        try {
            Connection con = db.getCon();
            PreparedStatement ps;
            ResultSet myRs;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);

            while (myRs.next()) {
                ChangedFees newItem = new ChangedFees();
                String id = myRs.getString("id");
                String roll = myRs.getString("roll");
                String semester = myRs.getString("semester");
                String departmentId = myRs.getString("department");
                String amount = myRs.getString("changed_amount");

                Department departmentName = mainController.getDepartmentById(departmentId);

                newItem.setId(id);
                newItem.setRoll(roll);
                newItem.setSemester(semester);
                newItem.setDepartment(departmentName.getDeptName());
                newItem.setChanged_amount(amount);
                changedDevelopmentfee.add(newItem);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return changedDevelopmentfee;
    }

    public static ArrayList<adminSemesterFeesTable> showAllSemesterFees(int start, int total) {
        dbConnection db = new dbConnection();
        ArrayList<adminSemesterFeesTable> semesterfee = new ArrayList<adminSemesterFeesTable>();
        String sql = "select * from admin_semester_fees_table limit " + (start - 1) + "," + total;
        try {
            Connection con = db.getCon();
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            while (myRs.next()) {
                adminSemesterFeesTable newItem = new adminSemesterFeesTable();
                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String semester_admission_fee = myRs.getString("semester_admission_fee");
                String tution_fee = myRs.getString("tution_fee");
                String lab_or_seminar_fee = myRs.getString("lab_or_seminar_fee");
                String transport_fee = myRs.getString("transport_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setDepartment(dept.getDeptName());
                newItem.setSemester_admission_fee(semester_admission_fee);
                newItem.setTution_fee(tution_fee);
                newItem.setLab_or_seminar_fee(lab_or_seminar_fee);
                newItem.setTransport_fee(transport_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
                semesterfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return semesterfee;
    }

    public static ArrayList<adminFormFillUpFeesTable> showAllFormfillupFees(int start, int total) {
        dbConnection db = new dbConnection();
        ArrayList<adminFormFillUpFeesTable> formfillupfee = new ArrayList<adminFormFillUpFeesTable>();
        String sql = "select * from admin_formfillup_fees_table limit " + (start - 1) + "," + total;
        try {
            Connection con = db.getCon();
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            while (myRs.next()) {
                adminFormFillUpFeesTable newItem = new adminFormFillUpFeesTable();
                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String main_fee = myRs.getString("main_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setDepartment(dept.getDeptName());
                newItem.setSemester(semester);
                newItem.setMain_fee(main_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
                formfillupfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return formfillupfee;
    }

    public static adminSemesterFeesTable getSemesterFeeById(String ID) {
        dbConnection db = new dbConnection();

        String sql = "select * from  admin_semester_fees_table where id = '" + ID + "'";
        Connection con = db.getCon();
        adminSemesterFeesTable newItem = new adminSemesterFeesTable();

        try {
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            System.out.print(myRs);
            while (myRs.next()) {

                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String semester_admission_fee = myRs.getString("semester_admission_fee");
                String tution_fee = myRs.getString("tution_fee");
                String lab_or_seminar_fee = myRs.getString("lab_or_seminar_fee");
                String transport_fee = myRs.getString("transport_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setSemester(semester);
                newItem.setDepartment(dept.getDeptName());
                newItem.setSemester_admission_fee(semester_admission_fee);
                newItem.setTution_fee(tution_fee);
                newItem.setLab_or_seminar_fee(lab_or_seminar_fee);
                newItem.setTransport_fee(transport_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newItem;

    }

    public static adminFormFillUpFeesTable getFormfillupFeeById(String ID) {
        dbConnection db = new dbConnection();

        String sql = "select * from  admin_formfillup_fees_table where id = '" + ID + "'";
        Connection con = db.getCon();
        adminFormFillUpFeesTable newItem = new adminFormFillUpFeesTable();

        try {
            PreparedStatement ps, ps1;
            ResultSet myRs, myRs1;
            ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            System.out.print(myRs);
            while (myRs.next()) {

                String id = myRs.getString("id");
                String deptId = myRs.getString("department");
                String semester = myRs.getString("semester");
                String main_fee = myRs.getString("main_fee");
                String misce_fee = myRs.getString("misce_fee");
                String start_date = myRs.getString("start_date");
                String end_date = myRs.getString("end_date");

                Department dept = mainController.getDepartmentById(deptId);

                newItem.setId(id);
                newItem.setDepartment(dept.getDeptName());
                newItem.setSemester(semester);
                newItem.setMain_fee(main_fee);
                newItem.setMisce_fee(misce_fee);
                newItem.setStart_date(start_date);
                newItem.setEnd_date(end_date);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newItem;
    }

    public static ArrayList<Devfees> showAllPaidDevelopmentFees() {
        dbConnection db = new dbConnection();
        ArrayList<Devfees> devfee = new ArrayList<Devfees>();
        String sql = "select * from  development_fees ORDER BY id DESC ";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {

                Devfees newItem = new Devfees();
                String id = myRs.getString("id");
                String departmentId = myRs.getString("departmentId");
                String semester = myRs.getString("semester");
                String stuId = myRs.getString("studentId");
                String amount = myRs.getString("amount");
                String transId = myRs.getString("transId");
                String date = myRs.getString("date");
                Boolean status = myRs.getBoolean("paymentStatus");


                newItem.setId(id);
                newItem.setDepartmentId(departmentId);
                newItem.setSemester(semester);
                newItem.setStudentId(stuId);
                newItem.setAmount(amount);
                newItem.setTransId(transId);
                newItem.setPaymentTime(date);
                newItem.setPaymentStatus(status);

                devfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return devfee;
    }


    public static ArrayList<SemesterFees> showAllPaidSemesterFees() {
        ArrayList<SemesterFees> semfee = new ArrayList<SemesterFees>();
        dbConnection db = new dbConnection();
        String sql = "select * from  semester_fees2 ORDER BY id DESC ";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {


                SemesterFees newItem = new SemesterFees();
                String id = myRs.getString("id");
                String departmentId = myRs.getString("departmentId");
                String semester = myRs.getString("semester");
                String stuId = myRs.getString("studentId");
                String amount = myRs.getString("amount");
                String transId = myRs.getString("transId");
                String date = myRs.getString("date");
                Boolean status = myRs.getBoolean("paymentStatus");


                newItem.setId(id);
                newItem.setDepartmentId(departmentId);
                newItem.setSemester(semester);
                newItem.setStudentId(stuId);
                newItem.setAmount(amount);
                newItem.setTransId(transId);
                newItem.setPaymentTime(date);
                newItem.setPaymentStatus(status);

                semfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return semfee;
    }


    public static ArrayList<FormfillupFees> showAllPaidFormfillupFees() {
        ArrayList<FormfillupFees> formfillupfee = new ArrayList<FormfillupFees>();
        dbConnection db = new dbConnection();
        String sql = "select * from  formfillup_fees ORDER BY id DESC ";
        Connection con = db.getCon();
        try {

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet myRs = ps.executeQuery(sql);
            while (myRs.next()) {

                FormfillupFees newItem = new FormfillupFees();
                String id = myRs.getString("id");
                String departmentId = myRs.getString("departmentId");
                String semester = myRs.getString("semester");
                String stuId = myRs.getString("studentId");
                String amount = myRs.getString("amount");
                String transId = myRs.getString("transId");
                String date = myRs.getString("date");
                Boolean status = myRs.getBoolean("paymentStatus");

                newItem.setId(id);
                newItem.setDepartmentId(departmentId);
                newItem.setSemester(semester);
                newItem.setStudentId(stuId);
                newItem.setAmount(amount);
                newItem.setTransId(transId);
                newItem.setPaymentTime(date);
                newItem.setPaymentStatus(status);

                formfillupfee.add(newItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return formfillupfee;
    }

}
