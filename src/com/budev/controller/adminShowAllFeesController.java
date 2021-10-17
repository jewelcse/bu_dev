package com.budev.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class adminShowAllFeesController
 */
@WebServlet("/adminShowAllFeesController")
public class adminShowAllFeesController extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // adminShowAllFeesController?target=all_developmentfee
        // adminShowAllFeesController?target=all_semesterfee
        // adminShowAllFeesController?target=all_formfillupfee

        String target = request.getParameter("target");

        if (target.equals("all_developmentfee")) {

            //ArrayList<Devfees> list = adminFeesDao.showAllPaidDevelopmentFees();

            //request.setAttribute("show_dev_fee_list", list);

            RequestDispatcher view = request.getRequestDispatcher("admin_show_development_fees_table.jsp");
            view.forward(request, response);

        } else if (target.equals("all_semesterfee")) {
            //ArrayList<SemesterFees> list = adminFeesDao.showAllPaidSemesterFees();

            //request.setAttribute("show_sem_fee_list", list);

            RequestDispatcher view = request.getRequestDispatcher("admin_show_semester_fees_table.jsp");
            view.forward(request, response);

        } else if (target.equals("all_formfillupfee")) {

            //ArrayList<FormfillupFees> list = adminFeesDao.showAllPaidFormfillupFees();

            //request.setAttribute("show_form_fee_list", list);

            RequestDispatcher view = request.getRequestDispatcher("admin_show_formfillup_fees_table.jsp");
            view.forward(request, response);

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
