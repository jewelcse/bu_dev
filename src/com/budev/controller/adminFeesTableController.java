package com.budev.controller;



import com.budev.model.adminDevelopmentFeesTable;
import com.budev.model.adminFormFillUpFeesTable;
import com.budev.model.adminSemesterFeesTable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/adminFeesTableController")
public class adminFeesTableController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fee_type = request.getParameter("type");
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        System.out.println(fee_type + " id  " + id);

        String tbl1 = "development_fees";
        String tbl2 = "formfillup_fees";
        String tbl3 = "semester_fees2";

        if (fee_type.equals("development_fee") && status.equals("true")) {

            if (mainController.updatePaymentStatusToVerify(tbl1, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_developmentfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        } else if (fee_type.equals("development_fee") && status.equals("false")) {

            if (mainController.updatePaymentStatusToNotVerify(tbl1, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_developmentfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        } else if (fee_type.equals("formfillup_fee") && status.equals("true")) {

            if (mainController.updatePaymentStatusToVerify(tbl2, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_formfillupfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        } else if (fee_type.equals("formfillup_fee") && status.equals("false")) {

            if (mainController.updatePaymentStatusToNotVerify(tbl2, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_formfillupfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        } else if (fee_type.equals("semester_fee") && status.equals("true")) {

            if (mainController.updatePaymentStatusToVerify(tbl3, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_semesterfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        } else if (fee_type.equals("semester_fee") && status.equals("false")) {

            if (mainController.updatePaymentStatusToNotVerify(tbl3, id)) {
                System.out.println("successfully updated payment status !");
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("adminShowAllFeesController?target=all_semesterfee");

                dispatcher.forward(request, response);
            } else {
                System.out.println("Failed to updated payment status !");
            }

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String edit_fee_type = request.getParameter("edit_fee_type");

        String pageNo = request.getParameter("page");
        System.out.println(pageNo);
        int currentPageNo = Integer.parseInt(pageNo);

        if (edit_fee_type.equals("developmentfee")) {
            // current_page=adminFeesManageController?type=developmentfee&&page=1
            // adminFeesManageController?type=developmentfee&&page=1

            String prev_page = "adminFeesManageController?type=developmentfee&&page=" + currentPageNo;

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String id = request.getParameter("id");
            // int newId=Integer.parseInt(id);
            String semester = request.getParameter("semester");
            String main_fee = request.getParameter("main_fee");
            String misce_fee = request.getParameter("misce_fee");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");

            adminDevelopmentFeesTable devfee = new adminDevelopmentFeesTable();

            devfee.setId(id);
            devfee.setSemester(semester);
            devfee.setMain_fee(main_fee);
            devfee.setMisce_fee(misce_fee);
            devfee.setStart_date(start_date);
            devfee.setEnd_date(end_date);

            mainController.updateDevelopmentFeesTable(devfee);

            response.sendRedirect(prev_page);

        } else if (edit_fee_type.equals("semesterfee")) {

            String prev_page = "adminFeesManageController?type=semesterfee&&page=" + currentPageNo;

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String id = request.getParameter("id");
            String semester = request.getParameter("semester");
            String semester_admission_fee = request.getParameter("semester_admission_fee");
            String tution_fee = request.getParameter("tution_fee");
            String lab_or_seminar_fee = request.getParameter("lab_or_seminar_fee");
            String transport_fee = request.getParameter("transport_fee");
            String misce_fee = request.getParameter("misce_fee");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");

            adminSemesterFeesTable semfee = new adminSemesterFeesTable();

            semfee.setId(id);
            semfee.setSemester(semester);
            semfee.setSemester_admission_fee(semester_admission_fee);
            semfee.setTution_fee(tution_fee);
            semfee.setLab_or_seminar_fee(lab_or_seminar_fee);
            semfee.setTransport_fee(transport_fee);
            semfee.setMisce_fee(misce_fee);
            semfee.setStart_date(start_date);
            semfee.setEnd_date(end_date);

            mainController.updateSemesterFeesTable(semfee);

            response.sendRedirect(prev_page);

        } else if (edit_fee_type.equals("formfillupfee")) {

            String prev_page = "adminFeesManageController?type=formfillupfee&&page=" + currentPageNo;

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String id = request.getParameter("id");
            // int newId=Integer.parseInt(id);
            String semester = request.getParameter("semester");
            String main_fee = request.getParameter("main_fee");
            String misce_fee = request.getParameter("misce_fee");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");

            adminFormFillUpFeesTable formfillupfee = new adminFormFillUpFeesTable();

            formfillupfee.setId(id);
            formfillupfee.setSemester(semester);
            formfillupfee.setMain_fee(main_fee);
            formfillupfee.setMisce_fee(misce_fee);
            formfillupfee.setStart_date(start_date);
            formfillupfee.setEnd_date(end_date);

            mainController.updateFormFillUpFeesTable(formfillupfee);

            response.sendRedirect(prev_page);

        }

    }

}
