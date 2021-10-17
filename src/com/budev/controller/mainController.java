package com.budev.controller;



import com.budev.model.*;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

public class mainController {
    static dbConnection db = new dbConnection();

    /* Add student to the Database method */

    public static void addStudent(Student newStudent) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String sql = "insert into student "
                + "(s_Roll,s_Reg,s_Name,s_Father_name,s_Mother_name,s_Email,s_Phone,s_Pass,s_Semester,s_Department,s_Faculty) "
                + "values (?,?,?,?,?,?,?,?,?,?,?)";
        myStmt = myConn.prepareStatement(sql);
        myStmt.setString(1, newStudent.getS_roll());
        myStmt.setString(2, newStudent.getS_reg());
        myStmt.setString(3, newStudent.getS_name());
        myStmt.setString(4, newStudent.getS_father_name());
        myStmt.setString(5, newStudent.getS_mother_name());
        myStmt.setString(6, newStudent.getS_email());
        myStmt.setString(7, newStudent.getS_phone());
        myStmt.setString(8, newStudent.getS_password());
        myStmt.setString(9, newStudent.getS_semester());
        myStmt.setString(10, newStudent.getS_department());
        myStmt.setString(11, newStudent.getS_faculty());
        myStmt.execute();
    }

    /* Student Login method to Authorized the Student */
    public static Student login(Student login_student) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String roll = login_student.getS_roll();
        String password = login_student.getS_password();
        String sql = "select * from student where s_Roll = '" + roll + "' AND s_Pass = '" + password + "'";
        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            boolean more = myRs.next();
            if (!more) {
                System.out.println("----->Login Failed!");
                login_student.setValid(false);
            } else if (more) {
                String d_id = myRs.getString("s_Id");
                String d_roll = myRs.getString("s_Roll");
                String d_reg = myRs.getString("s_Reg");
                String d_name = myRs.getString("s_Name");
                String d_fname = myRs.getString("s_Father_name");
                String d_mname = myRs.getString("s_Mother_name");
                String d_email = myRs.getString("s_Email");
                String d_phone = myRs.getString("s_Phone");
                String d_semester = myRs.getString("s_Semester");
                String d_dept = myRs.getString("s_Department");
                String d_faculty = myRs.getString("s_Faculty");
                // System.out.println("Welcome " + d_name);
                // login_student.setS_name(name);
                login_student.setId(d_id);
                login_student.setS_roll(d_roll);
                login_student.setS_reg(d_reg);
                login_student.setS_name(d_name);
                login_student.setS_father_name(d_fname);
                login_student.setS_mother_name(d_mname);
                login_student.setS_email(d_email);
                login_student.setS_phone(d_phone);
                login_student.setS_faculty(d_faculty);
                login_student.setS_semester(d_semester);
                login_student.setS_department(d_dept);
                login_student.setValid(true);
                System.out.println("----->Login Successful!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return login_student;
    }

	/*
	 * After completing payment process students information save to the database
	 * for Development Fees for Semester Admission Fee for Form fill up Fee
	 * 
	 
	public static String addDevFeestoDb(Devfees newDevfees) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		Statement stmt = null;
		myConn = db.getCon();
		String result = "";
	
			String sql = "insert into development_fees " + "(s_id,semester,amount) " + "values (?,?,?)";
			myStmt = (PreparedStatement) myConn.prepareStatement(sql);

			myStmt.execute();
			System.out.print("----->Development Fees payment successful!");
			return result = "success";
		
	}
*/
	/*	public static String addsemesterFeestoDb(SemesterFees newsemesterFee) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		Statement stmt = null;
		myConn = db.getCon();
		ResultSet myRs = null;
		String result = "";
		String id = newsemesterFee.getS_id();
		String semester = newsemesterFee.getS_semester();
		System.out.println(id + " " + semester);
		String select_sql = "select * from semester_fees2 where s_id = '" + id + "' AND semester = '" + semester + "'";
		stmt = myConn.createStatement();
		myRs = stmt.executeQuery(select_sql);
		boolean more = myRs.next();
		if (!more) {
			String sql = "insert into semester_fees2 " + "(s_id,semester,amount) " + "values (?,?,?)";
			myStmt = (PreparedStatement) myConn.prepareStatement(sql);
			myStmt.setString(1, newsemesterFee.getS_id());
			myStmt.setString(2, newsemesterFee.getS_semester());
			myStmt.setString(3, newsemesterFee.getS_semester_fee());
			myStmt.execute();
			System.out.print("----->Semester Fees payment successful!");
			return result = "success";
		} else {
			System.out.println("----->Already paid!");
			return result = "failed";
		}
	}

	public static String addFormfillupFeestoDb(FormfillupFees newFormfillup) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		Statement stmt = null;
		ResultSet myRs = null;
		myConn = db.getCon();
		String result = "";
		String id = newFormfillup.getS_id();
		String semester = newFormfillup.getS_semester();
		System.out.println(id + " " + semester);
		String select_sql = "select * from formfillup_fees where s_id = '" + id + "' AND semester = '" + semester + "'";
		stmt = myConn.createStatement();
		myRs = stmt.executeQuery(select_sql);
		boolean more = myRs.next();
		if (!more) {
			String sql = "insert into  formfillup_fees " + "(semester,amount,s_id) " + "values (?,?,?)";
			myStmt = (PreparedStatement) myConn.prepareStatement(sql);
			myStmt.setString(1, newFormfillup.getS_semester());
			myStmt.setString(2, newFormfillup.getS_amount());
			myStmt.setString(3, newFormfillup.getS_id());
			myStmt.execute();
			System.out.print("----->Formfillup Fees payment successful!");
			return result = "success";
		} else {
			System.out.println("----->Already paid!");
			return result = "failed";
		}
	}

	
	 * This method check duplication for more than several record for same user in
	 * same semester
	 */

    public static boolean FindDuplicateChangedDevelopmentFees(String roll, String semester, String departmentId) {

        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        ResultSet myRs = null;

        myConn = db.getCon();

        String select_sql = "select * from changed_development_fee where roll = '" + roll + "' AND semester = '"
                + semester + "' AND department = '" + departmentId + "'";
        try {
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(select_sql);

            boolean more = myRs.next();

            if (more) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void ChangedFeesNow(ChangedFees changedFees) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();

        String roll = changedFees.getRoll();
        String semester = changedFees.getSemester();
        String amount = changedFees.getChanged_amount();
        String departmentId = changedFees.getDepartment();

        String sql = "insert into changed_development_fee (roll,semester,department,changed_amount) values (?,?,?,?)";
        try {
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, roll);
            myStmt.setString(2, semester);
            myStmt.setString(3, departmentId);
            myStmt.setString(4, amount);
            myStmt.execute();
            System.out.print("--->Changed Development Fee Successfull!\n");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public static Admin admin_login(Admin login_admin) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String admin = login_admin.getName();
        String password = login_admin.getPassword();
        String adminType = login_admin.getAdminType();
        if (adminType.equals("super_admin")) {
            String sql1 = "select * from super_admin where name = '" + admin + "' AND password = '" + password + "'";
            try {
                myConn = db.getCon();
                stmt = myConn.createStatement();
                myRs = stmt.executeQuery(sql1);
                boolean more = myRs.next();
                if (!more) {
                    System.out.println("----->Super Admin Login Failed!");
                    login_admin.setSuperAdminIsvalid(false);
                } else if (more) {
                    login_admin.setSuperAdminIsvalid(true);
                    System.out.println("----->Super Admin Login Successful!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (adminType.equals("sub_admin")) {
            String sql2 = "select * from sub_admin where name = '" + admin + "' AND password = '" + password + "'";
            try {
                myConn = db.getCon();
                stmt = myConn.createStatement();
                myRs = stmt.executeQuery(sql2);
                boolean more = myRs.next();
                if (!more) {
                    System.out.println("----->Sub Admin Login Failed!");
                    login_admin.setSubAdminIsvalid(false);
                } else if (more) {
                    login_admin.setId(myRs.getString("id"));
                    login_admin.setName(myRs.getString("name"));
                    login_admin.setItem1(myRs.getString("update_development_fee"));
                    login_admin.setItem2(myRs.getString("student_information"));
                    login_admin.setItem3(myRs.getString("application_letters"));
                    login_admin.setItem4(myRs.getString("update_development_fees_table"));
                    login_admin.setItem5(myRs.getString("update_semester_fees_table"));
                    login_admin.setItem6(myRs.getString("update_formfillup_fees_table"));
                    login_admin.setSubAdminIsvalid(true);
                    System.out.println("----->Sub Admin Login Successful!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("----->Login Error!");
        }
        return login_admin;
    }

    public static boolean isValidDateToPay(String startDate, String endDate) throws ParseException {

        LocalDate today = LocalDate.now(ZoneId.systemDefault());
        String strDate = today.toString();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date curr = sdf.parse(strDate);

        if (startDate != null && endDate != null) {
            Date s_date = sdf.parse(startDate);
            Date e_date = sdf.parse(endDate);
            if (curr.compareTo(s_date) > 0 && curr.compareTo(e_date) < 0) {
                System.out.println("----->Valid Date to pay fees!");
                return true;
            } else if (curr.compareTo(s_date) == 0 || curr.compareTo(e_date) == 0) {
                System.out.println("----->Same Date and Valid Date to pay fees!");
                return true;
            } else {
                System.out.println("----->Date Expaire to pay  fees!");
                return false;
            }
        } else {
            System.out.println("----->ERROR!");
            return false;
        }

    }

    public static String checkValidity(String feeType, String semester, String departmentId)
            throws SQLException, ParseException {
        String sql = "";
        Connection con = db.getCon();
        String result = "";
        Statement stmt = null;
        ResultSet myRs = null;
        if (feeType.equals("devfee")) {
            sql = "select * from  admin_development_fees_table where semester = '" + semester + "' AND department = '"
                    + departmentId + "'  ";
            PreparedStatement ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            if (myRs.next()) {
                String startDate = myRs.getString("start_date");
                String endDate = myRs.getString("end_date");

                if (isValidDateToPay(startDate, endDate)) {
                    result = "dev_page";
                } else {
                    result = "false";
                }

            } else {
                System.out.println("----->ERROR IN CHECKVALIDITY CONTROLLER IN LINE 484!");
            }
        } else if (feeType.equals("semfee")) {
            sql = "select * from  admin_semester_fees_table  where semester = '" + semester + "' AND department = '"
                    + departmentId + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            if (myRs.next()) {
                String startDate = myRs.getString("start_date");
                String endDate = myRs.getString("end_date");
                if (isValidDateToPay(startDate, endDate)) {
                    result = "semester_page";
                } else {
                    result = "false";
                }

            } else {
                System.out.println("----->ERROR IN CHECKVALIDITY CONTROLLER IN LINE 515!");
            }
        } else if (feeType.equals("formfee")) {
            sql = "select * from  admin_formfillup_fees_table where semester = '" + semester + "' AND department = '"
                    + departmentId + "'";
            PreparedStatement ps = con.prepareStatement(sql);
            myRs = ps.executeQuery(sql);
            if (myRs.next()) {
                String startDate = myRs.getString("start_date");
                String endDate = myRs.getString("end_date");
                if (isValidDateToPay(startDate, endDate)) {
                    result = "formfillup_page";
                } else {
                    result = "false";
                }
            } else {
                System.out.println("----->ERROR IN CHECKVALIDITY CONTROLLER IN LINE 546!");
            }
        }
        return result;
    }

    // update development fee table
    public static void updateDevelopmentFeesTable(adminDevelopmentFeesTable devfee) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update admin_development_fees_table  set semester=?,main_fee=?,misce_fee=?,start_date=?,end_date=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, devfee.getSemester());
            myStmt.setString(2, devfee.getMain_fee());
            myStmt.setString(3, devfee.getMisce_fee());
            myStmt.setString(4, devfee.getStart_date());
            myStmt.setString(5, devfee.getEnd_date());
            myStmt.setString(6, devfee.getId());
            myStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // update semester fee table
    public static void updateSemesterFeesTable(adminSemesterFeesTable semfee) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update admin_semester_fees_table  set semester=?,semester_admission_fee=?,tution_fee=?,lab_or_seminar_fee=?,transport_fee=?,misce_fee=?,start_date=?,end_date=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, semfee.getSemester());
            myStmt.setString(2, semfee.getSemester_admission_fee());
            myStmt.setString(3, semfee.getTution_fee());
            myStmt.setString(4, semfee.getLab_or_seminar_fee());
            myStmt.setString(5, semfee.getTransport_fee());
            myStmt.setString(6, semfee.getMisce_fee());
            myStmt.setString(7, semfee.getStart_date());
            myStmt.setString(8, semfee.getEnd_date());
            myStmt.setString(9, semfee.getId());
            myStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // update formfillup table

    public static void updateFormFillUpFeesTable(adminFormFillUpFeesTable formfillupfee) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update admin_formfillup_fees_table  set semester=?,main_fee=?,misce_fee=?,start_date=?,end_date=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, formfillupfee.getSemester());
            myStmt.setString(2, formfillupfee.getMain_fee());
            myStmt.setString(3, formfillupfee.getMisce_fee());
            myStmt.setString(4, formfillupfee.getStart_date());
            myStmt.setString(5, formfillupfee.getEnd_date());
            myStmt.setString(6, formfillupfee.getId());
            myStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteAdmin(String delete_id) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String sql = "delete from sub_admin  where id = '" + delete_id + "'";
        myStmt = myConn.prepareStatement(sql);
        myStmt.execute();
        System.out.println("----->Deleted Sub Admin id = " + delete_id + " !");
    }

    public static void updateSubAdmin(String id, String name) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String sql = "UPDATE sub_admin SET name ='" + name + "' WHERE id='" + id + "'";
        myStmt = myConn.prepareStatement(sql);
        myStmt.execute();
        System.out.println("----->Update Sub Admin Successful!");
    }

    public static boolean addNewAdmin(String newAdminName, String password, String item1, String item2, String item3,
                                      String item4, String item5, String item6) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        ResultSet myRs = null;
        boolean retrunStatus = false;
        try {
            String sql = "select * from sub_admin where name = '" + newAdminName + "' ";
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            boolean more = myRs.next();
            if (!more) {
                String inserQuery = "insert into sub_admin "
                        + "(name,password,update_development_fee,student_information,application_letters,update_development_fees_table,update_semester_fees_table,update_formfillup_fees_table) "
                        + "values ('" + newAdminName + "','" + password + "','" + item1 + "','" + item2 + "','" + item3
                        + "','" + item4 + "','" + item5 + "','" + item6 + "')";
                myStmt = myConn.prepareStatement(inserQuery);
                myStmt.execute();
                retrunStatus = true;
                System.out.print("----->New Sub Admin Created Successfuly!");
            } else {
                System.out.println("----->Already have " + newAdminName + " !");
                retrunStatus = false;
            }
        } catch (Exception e) {
        }
        return retrunStatus;
    }

    public static Department getDepartmentIdByDepartmentName(String deptname) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from department where dept_name = '" + deptname + "'";
        Department dept = new Department();
        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                dept.setDeptId(myRs.getString("id"));
                dept.setDeptName(myRs.getString("dept_name"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dept;
    }

    public static Department getDepartmentById(String id) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from department where id = '" + id + "'";
        Department dept = new Department();
        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                dept.setDeptId(myRs.getString("id"));
                dept.setDeptName(myRs.getString("dept_name"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dept;
    }

    public static adminDevelopmentFeesTable findDevelopmentFee(String deptartment, String semester) {

        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from admin_development_fees_table where semester = '" + semester + "' and department ='"
                + deptartment + "' ";
        adminDevelopmentFeesTable devfee = new adminDevelopmentFeesTable();

        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                devfee.setMain_fee(myRs.getString("main_fee"));
                devfee.setMisce_fee(myRs.getString("misce_fee"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return devfee;

    }

    public static ChangedFees findChangedDevelopmentFee(String roll, String semester, String departmentId) {

        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from changed_development_fee where roll = '" + roll + "' and  semester = '" + semester
                + "' and department ='" + departmentId + "' ";
        ChangedFees chfee = new ChangedFees();

        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                chfee.setChanged_amount(myRs.getString("changed_amount"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chfee;
    }

    public static adminSemesterFeesTable findSemesterAdmissionFee(String departmentId, String semester) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from admin_semester_fees_table where semester = '" + semester + "' and department ='"
                + departmentId + "' ";
        adminSemesterFeesTable semfee = new adminSemesterFeesTable();

        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                semfee.setSemester_admission_fee(myRs.getString("semester_admission_fee"));
                semfee.setTution_fee(myRs.getString("tution_fee"));
                semfee.setLab_or_seminar_fee(myRs.getString("lab_or_seminar_fee"));
                semfee.setTransport_fee(myRs.getString("transport_fee"));
                semfee.setMisce_fee(myRs.getString("misce_fee"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return semfee;
    }

    public static adminFormFillUpFeesTable findFormfillupFee(String departmentId, String semester) {
        Statement stmt = null;
        Connection myConn = null;
        PreparedStatement myStmt = null;
        ResultSet myRs = null;
        String sql = "select * from admin_formfillup_fees_table where semester = '" + semester + "' and department ='"
                + departmentId + "' ";
        adminFormFillUpFeesTable formfillupfee = new adminFormFillUpFeesTable();

        try {
            myConn = db.getCon();
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(sql);
            while (myRs.next()) {

                formfillupfee.setMain_fee(myRs.getString("main_fee"));
                formfillupfee.setMisce_fee(myRs.getString("misce_fee"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return formfillupfee;
    }

    public static boolean isCahangedFeeMoreThanMainFee(String changed_amount, String semester, String departmentId) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        ResultSet myRs = null;
        String mainfee = "";
        String miscefee = "";

        myConn = db.getCon();

        String select_sql = "select * from admin_development_fees_table where semester = '" + semester
                + "' AND department = '" + departmentId + "'";
        try {
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(select_sql);

            /*
             * boolean more = myRs.next();
             *
             * if (more) { return true; }
             */

            while (myRs.next()) {
                mainfee = myRs.getString("main_fee");
                miscefee = myRs.getString("misce_fee");
            }

            int changedAmount = Integer.parseInt(changed_amount);
            int totalAmount = Integer.parseInt(mainfee) + Integer.parseInt(miscefee);

            System.out.println("changed amount " + changedAmount + " total " + totalAmount);

            return changedAmount > totalAmount;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static Boolean isAlreadyPaid(String deptId, String stuSemester, String stuId, String tableName) {

        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        ResultSet myRs = null;

        myConn = db.getCon();

        String select_sql = "select * from " + tableName + " where departmentId='" + deptId + "' AND semester = '"
                + stuSemester + "' AND studentId = '" + stuId + "' ";
        try {
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(select_sql);

            boolean more = myRs.next();

            if (more) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static String addFeesToDb(String tableName, Devfees developmentfee) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String result = "";

        String sql = "insert into " + tableName + "(departmentId,semester,amount,studentId,transId,date,paymentStatus) values(?,?,?,?,?,?,?) ";
        myStmt = myConn.prepareStatement(sql);

        myStmt.setString(1, developmentfee.getDepartmentId());
        myStmt.setString(2, developmentfee.getSemester());
        myStmt.setString(3, developmentfee.getAmount());
        myStmt.setString(4, developmentfee.getStudentId());
        myStmt.setString(5, developmentfee.getTransId());
        myStmt.setString(6, developmentfee.getPaymentTime());
        myStmt.setString(7, "0");

        myStmt.execute();
        System.out.print("----->Development Fees payment successful!");
        return result = "success";
    }

    public static String addFeesToDb(String tableName, SemesterFees semesterfee) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String result = "";

        String sql = "insert into " + tableName + "(departmentId,semester,amount,studentId,transId,date,paymentStatus) values(?,?,?,?,?,?,?) ";
        myStmt = myConn.prepareStatement(sql);

        myStmt.setString(1, semesterfee.getDepartmentId());
        myStmt.setString(2, semesterfee.getSemester());
        myStmt.setString(3, semesterfee.getAmount());
        myStmt.setString(4, semesterfee.getStudentId());
        myStmt.setString(5, semesterfee.getTransId());
        myStmt.setString(6, semesterfee.getPaymentTime());
        myStmt.setString(7, "0");

        myStmt.execute();
        System.out.print("----->Semester Fee payment successful!");
        return result = "success";
    }

    public static String addFeesToDb(String tableName, FormfillupFees formfillupFee) throws SQLException {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        String result = "";

        String sql = "insert into " + tableName + "(departmentId,semester,amount,studentId,transId,date,paymentStatus) values(?,?,?,?,?,?,?) ";
        myStmt = myConn.prepareStatement(sql);

        myStmt.setString(1, formfillupFee.getDepartmentId());
        myStmt.setString(2, formfillupFee.getSemester());
        myStmt.setString(3, formfillupFee.getAmount());
        myStmt.setString(4, formfillupFee.getStudentId());
        myStmt.setString(5, formfillupFee.getTransId());
        myStmt.setString(6, formfillupFee.getPaymentTime());
        myStmt.setString(7, "0");

        myStmt.execute();
        System.out.print("----->Formfillup payment successful!");
        return result = "success";
    }

	/*public static boolean updatePaymentStatus(String tblName, String id) {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		myConn = db.getCon();
		try {
			String sql = "update "+tblName +"  set paymentStatus=? where id=?";
			myStmt = (PreparedStatement) myConn.prepareStatement(sql);
			myStmt.setString(1, "1");
			myStmt.setString(2, id);
			myStmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}*/

    public static boolean updatePaymentStatusToVerify(String tblName, String id) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update " + tblName + "  set paymentStatus=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, "1");
            myStmt.setString(2, id);
            myStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updatePaymentStatusToNotVerify(String tblName, String id) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update " + tblName + "  set paymentStatus=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, "0");
            myStmt.setString(2, id);
            myStmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void makePermission(String col, String adminId) {

        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update sub_admin  set " + col + "=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, "1");
            myStmt.setString(2, adminId);
            myStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static void deniedPermission(String col, String adminId) {
        Connection myConn = null;
        PreparedStatement myStmt = null;
        myConn = db.getCon();
        try {
            String sql = "update sub_admin  set " + col + "=? where id=?";
            myStmt = myConn.prepareStatement(sql);
            myStmt.setString(1, "0");
            myStmt.setString(2, adminId);
            myStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean havePermission(String col, String adminId) {

        Connection myConn = null;
        PreparedStatement myStmt = null;
        Statement stmt = null;
        ResultSet myRs = null;

        myConn = db.getCon();

        String select_sql = "select " + col + " from sub_admin where " + col + "=1 and id='" + adminId + "' ";
        try {
            stmt = myConn.createStatement();
            myRs = stmt.executeQuery(select_sql);

            boolean more = myRs.next();

            if (more) {
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
