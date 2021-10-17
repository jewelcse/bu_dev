package com.budev.controller;



import com.budev.model.Devfees;
import com.budev.model.FormfillupFees;
import com.budev.model.SemesterFees;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class paymentStatus
 */
@WebServlet("/paymentStatus")
public class paymentStatus extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String res = request.getParameter("response");
        PrintWriter out = response.getWriter();
        if (res.equals("success")) {

            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
            dispatcher.forward(request, response);

        } else if (res.equals("failed")) {
            out.write("failed");

        } else if (res.equals("already_paid")) {
            out.write("already_paid");

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, String[]> map = request.getParameterMap();
        Map<String, String> map2 = new HashMap<String, String>();

        String action = request.getParameter("action");

        String deptId = request.getParameter("deptId");
        String stuId = request.getParameter("stuId");
        String stuSemester = request.getParameter("semester");
        com.budev.sslcommerz.TransactionResponseValidator transactionResponseValidator = new com.budev.sslcommerz.TransactionResponseValidator();

        if (action.equals("developmentfee")) {

            // transactionResponseValidator.receiveSuccessResponse(map);
            int line = 1;
            for (String var : map.keySet()) {
                // System.out.println(map.get(var).length);
                String[] array = map.get(var);
                for (String string : array) {
                    System.out.println("line " + line++ + " -> " + var + " : " + string + "\n\n");
                    map2.put(var, string);
                }
            }
            try {
                String tranI = map2.get("tran_id");
                String amount = map2.get("amount");
                String paymentTime = map2.get("tran_date");
                // System.out.println(paymentTime+" from map2");
                // System.out.println(amount+" from map2 ");

                // String amount = "100";
                // System.out.println(tranI);
                /*
                 * String tranId = map2.get("tran_id"); String stuId = map2.get("stu_id");
                 * String stuDept = map2.get("stu_dept"); String stuSemester =
                 * map2.get("stu_semester");
                 */

                if (transactionResponseValidator.receiveSuccessResponse(map2)) {

                    System.out.println("success page development fee,trans id - " + tranI + ",stu id - " + stuId + ", dept id- "
                            + deptId + ", semester - " + stuSemester);

                    String tableName = "development_fees";
                    Boolean haveDevfee = mainController.isAlreadyPaid(deptId, stuSemester, stuId, tableName);
                    System.out.println(" current status " + haveDevfee);

                    if (!haveDevfee) {

                        Devfees newDevfees = new Devfees();

                        newDevfees.setStudentId(stuId);
                        newDevfees.setDepartmentId(deptId);
                        newDevfees.setSemester(stuSemester);
                        newDevfees.setAmount(amount);
                        newDevfees.setTransId(tranI);
                        newDevfees.setPaymentTime(paymentTime);

                        // mainController.addDevFeestoDb(newDevfees);
                        String res = mainController.addFeesToDb(tableName, newDevfees);
                        if (res.equals("success")) {

                            request.setAttribute("receipt", newDevfees);

                            RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
                            dispatcher.forward(request, response);
                            //response.sendRedirect("paymentStatus?response=success");
                            //response.sendRedirect("paymentStatus?response=success");

                        } else {
                            response.sendRedirect("paymentStatus?response=failed");
                        }

                    } else {
                        response.sendRedirect("paymentStatus?response=already_paid");
                    }

                } else {
                    System.out.println("Error occure in receiveSuccessResponse method!");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else if (action.equals("semesterfee")) {

            // transactionResponseValidator.receiveSuccessResponse(map);
            int line = 1;
            for (String var : map.keySet()) {
                // System.out.println(map.get(var).length);
                String[] array = map.get(var);
                for (String string : array) {
                    System.out.println("line " + line++ + " -> " + var + " : " + string + "\n\n");
                    map2.put(var, string);
                }
            }
            try {
                String tranI = map2.get("tran_id");
                String amount = map2.get("amount");
                String paymentTime = map2.get("tran_date");

                if (transactionResponseValidator.receiveSuccessResponse(map2)) {

                    System.out.println("success page for semester fee ,trans id - " + tranI + ",stu id - " + stuId
                            + ", dept id- " + deptId + ", semester - " + stuSemester);

                    String tableName = "semester_fees2";
                    Boolean haveSemfee = mainController.isAlreadyPaid(deptId, stuSemester, stuId, tableName);
                    System.out.println(" current status " + haveSemfee);

                    if (!haveSemfee) {

                        SemesterFees newSemFee = new SemesterFees();

                        newSemFee.setStudentId(stuId);
                        newSemFee.setDepartmentId(deptId);
                        newSemFee.setSemester(stuSemester);
                        newSemFee.setAmount(amount);
                        newSemFee.setTransId(tranI);
                        newSemFee.setPaymentTime(paymentTime);

                        String res = mainController.addFeesToDb(tableName, newSemFee);
                        if (res.equals("success")) {
                            response.sendRedirect("paymentStatus?response=success");

                        } else {
                            response.sendRedirect("paymentStatus?response=failed");
                        }

                    } else {
                        response.sendRedirect("paymentStatus?response=already_paid");
                    }

                } else {
                    System.out.println("Error occure in receiveSuccessResponse method!");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } else if (action.equals("formfillupfee")) {
            // transactionResponseValidator.receiveSuccessResponse(map);
            int line = 1;
            for (String var : map.keySet()) {
                // System.out.println(map.get(var).length);
                String[] array = map.get(var);
                for (String string : array) {
                    System.out.println("line " + line++ + " -> " + var + " : " + string + "\n\n");
                    map2.put(var, string);
                }
            }
            try {
                String tranI = map2.get("tran_id");
                String amount = map2.get("amount");
                String paymentTime = map2.get("tran_date");

                if (transactionResponseValidator.receiveSuccessResponse(map2)) {

                    System.out.println("success page for formfillup fee ,trans id - " + tranI + ",stu id - " + stuId
                            + ", dept id- " + deptId + ", semester - " + stuSemester);

                    String tableName = "formfillup_fees";
                    Boolean haveFormfillupfee = mainController.isAlreadyPaid(deptId, stuSemester, stuId, tableName);
                    System.out.println(" current status " + haveFormfillupfee);

                    if (!haveFormfillupfee) {

                        FormfillupFees formfillupFee = new FormfillupFees();

                        formfillupFee.setStudentId(stuId);
                        formfillupFee.setDepartmentId(deptId);
                        formfillupFee.setSemester(stuSemester);
                        formfillupFee.setAmount(amount);
                        formfillupFee.setTransId(tranI);
                        formfillupFee.setPaymentTime(paymentTime);

                        String res = mainController.addFeesToDb(tableName, formfillupFee);
                        if (res.equals("success")) {
                            response.sendRedirect("paymentStatus?response=success");

                        } else {
                            response.sendRedirect("paymentStatus?response=failed");
                        }

                    } else {
                        response.sendRedirect("paymentStatus?response=already_paid");
                    }

                } else {
                    System.out.println("Error occure in receiveSuccessResponse method!");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } else {
            System.out.println("Nothing sepcified!!!");
        }

    }


}
