package com.budev.controller;



import com.budev.Dao.studentsDao;
import com.budev.model.*;
import com.mysql.jdbc.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

@WebServlet("/devFeesController")
public class devFeesController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // devFeesController?feetype=devfees
        // devFeesController?feetype=semesterfee
        // devFeesController?feetype=formfillupfee

        String sub = request.getParameter("feetype");

        String id = request.getParameter("s_id");
        String semester = request.getParameter("s_semester");
        String amount = request.getParameter("total_amount");

        // System.out.println(semester);
        // System.out.println("id" + id + "semester " + semester + " amount " +
        // development_fee);

        if (sub.equals("devfees")) {

            if (!semester.equals("0")) {

                //String rand1 = UUID.randomUUID().toString();
                String rand2 = UUID.randomUUID().toString();
                // System.out.println(id);
                Student student = studentsDao.getStudentProfileById(id);
                // System.out.println("name"+student.getS_name());

                // System.out.println(student.getId() + " ++++" + student.getS_department());
                Devfees devfees = new Devfees();

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyMM-ddHH-mmss");
                LocalDateTime now = LocalDateTime.now();
                String time = (dtf.format(now));

                String trans_id = time + "-" + rand2;
                System.out.println(trans_id);

                // System.out.println(student.toString());
                String deptName = student.getS_department();
                Department dept = mainController.getDepartmentIdByDepartmentName(deptName);

                // System.out.println("-------------->" + dept.getDeptId());
                devfees.setStudentId(id);
                devfees.setSemester(semester);
                devfees.setAmount(amount);
                devfees.setTransId(trans_id);
                devfees.setDepartmentId(dept.getDeptId());

                com.budev.sslcommerz.TransactionInitiator trans = new com.budev.sslcommerz.TransactionInitiator();

                String response1 = trans.initTrnxnRequest(student, devfees);
                System.out.println("LINE 131 " + response1);

                response.sendRedirect(response1);


            } else {
                HttpSession session = request.getSession(true);
                String pagename = (String) session.getAttribute("current_page");
                System.out.println("show js msg for confirm semester");
                response.sendRedirect(pagename);
            }
        } else if (sub.equals("semesterfee")) {

            if (!semester.equals("0")) {

                //String rand1 = UUID.randomUUID().toString();
                String rand2 = UUID.randomUUID().toString();
                Student student = studentsDao.getStudentProfileById(id);
                SemesterFees semfee = new SemesterFees();


                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyMM-ddHH-mmss");
                LocalDateTime now = LocalDateTime.now();
                String time = (dtf.format(now));


                String trans_id = time + "-" + rand2;
                System.out.println(trans_id);

                String deptName = student.getS_department();
                Department dept = mainController.getDepartmentIdByDepartmentName(deptName);

                semfee.setStudentId(id);
                semfee.setSemester(semester);
                semfee.setAmount(amount);
                semfee.setTransId(trans_id);
                semfee.setDepartmentId(dept.getDeptId());

                com.budev.sslcommerz.TransactionInitiator trans = new com.budev.sslcommerz.TransactionInitiator();

                String response2 = trans.initTrnxnRequest(student, semfee);
                System.out.println("LINE 144 " + response2);

                response.sendRedirect(response2);


            } else {
                HttpSession session = request.getSession(true);
                String pagename = (String) session.getAttribute("current_page");
                System.out.println("show js msg for confirm semester");
                response.sendRedirect(pagename);
            }

        } else if (sub.equals("formfillupfee")) {
            if (!semester.equals("0")) {

                //String rand1 = UUID.randomUUID().toString();
                String rand2 = UUID.randomUUID().toString();

                Student student = studentsDao.getStudentProfileById(id);
                FormfillupFees formfillupfee = new FormfillupFees();

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyMM-ddHH-mmss");
                LocalDateTime now = LocalDateTime.now();
                String time = (dtf.format(now));

                String trans_id = time + "-" + rand2;
                System.out.println(trans_id);

                String deptName = student.getS_department();
                Department dept = mainController.getDepartmentIdByDepartmentName(deptName);

                formfillupfee.setStudentId(id);
                formfillupfee.setSemester(semester);
                formfillupfee.setAmount(amount);
                formfillupfee.setTransId(trans_id);
                formfillupfee.setDepartmentId(dept.getDeptId());

                com.budev.sslcommerz.TransactionInitiator trans = new com.budev.sslcommerz.TransactionInitiator();

                String response3 = trans.initTrnxnRequest(student, formfillupfee);
                System.out.println("LINE 193 " + response3);

                response.sendRedirect(response3);

            } else {
                HttpSession session = request.getSession(true);
                String pagename = (String) session.getAttribute("current_page");
                System.out.println("show js msg for confirm semester");
                response.sendRedirect(pagename);
            }
        } else if (sub.equals("application_form")) {

            String aid = request.getParameter("id");
            String asemester = request.getParameter("semester");
            String subject = request.getParameter("subject");
            String subject2 = request.getParameter("subject2");
            String feetype = request.getParameter("feetype");
            String reason = request.getParameter("reason"); // String reason1 = StringEscapeUtils. String
            String dept = request.getParameter("s_dept");
            String newSub = "";

            if (subject != null && subject2 != null) {
                newSub = subject + " and " + subject2;
            } else if (subject.length() > 0) {
                newSub = subject;
            } else if (subject2.length() > 0) {
                newSub = subject2;
            } else {
                newSub = "";
            }

            Connection myConn = null;
            PreparedStatement myStmt = null;

            dbConnection db = new dbConnection();

            myConn = db.getCon();

            String sql = "insert into application_form_table "
                    + "(semester,subject,feeType,reason,student_id,department) " + "values (?,?,?,?,?,?)";

            try {
                myStmt = (PreparedStatement) myConn.prepareStatement(sql);
                myStmt.setString(1, asemester);
                myStmt.setString(2, newSub);
                myStmt.setString(3, feetype);
                myStmt.setString(4, reason);
                myStmt.setString(5, aid);
                myStmt.setString(6, dept);

                myStmt.execute();

                System.out.print("application-submit-success");
                //response.setContentType("application/pdf");
                //response.setHeader("content-disposition", "Filename.pdf");
                RequestDispatcher dispatcher = request.getRequestDispatcher("success_form.jsp");
                dispatcher.forward(request, response);

            } catch (SQLException e) { // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } else {
            System.out.println("nothing");
        }

    }

}
