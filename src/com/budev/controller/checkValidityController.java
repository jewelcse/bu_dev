package com.budev.controller;



import com.budev.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

@WebServlet("/checkValidityController")
public class checkValidityController extends HttpServlet {

    dbConnection db = new dbConnection();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String semester = request.getParameter("semester");
        String feeType = request.getParameter("fee_type");
        String departmentId = request.getParameter("departmentId");
        String roll = request.getParameter("roll");

        HttpSession session = request.getSession(true);

        try {
            String res = null;
            try {
                res = mainController.checkValidity(feeType, semester, departmentId);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            System.out.println("Res value: " + res);

            if (res.equals("dev_page")) {

                adminDevelopmentFeesTable devfee;
                devfee = mainController.findDevelopmentFee(departmentId, semester);

                System.out.println("devfee = " + devfee.getMain_fee() + devfee.getMisce_fee());

                ChangedFees changedfee = mainController.findChangedDevelopmentFee(roll, semester, departmentId);

                System.out.println("chfee " + changedfee.getChanged_amount());
                String chfee = changedfee.getChanged_amount();

                request.setAttribute("mainfee", devfee.getMain_fee());
                request.setAttribute("miscefee", devfee.getMisce_fee());
                request.setAttribute("changedfee", chfee);

                request.getRequestDispatcher("devFees.jsp").forward(request, response);

            } else if (res.equals("semester_page")) {

                adminSemesterFeesTable semfee;
                semfee = mainController.findSemesterAdmissionFee(departmentId, semester);

                request.setAttribute("fee1", semfee.getSemester_admission_fee());
                request.setAttribute("fee2", semfee.getTution_fee());
                request.setAttribute("fee3", semfee.getLab_or_seminar_fee());
                request.setAttribute("fee4", semfee.getTransport_fee());
                request.setAttribute("fee5", semfee.getMisce_fee());

                request.getRequestDispatcher("semesterFees.jsp").forward(request, response);

                //RequestDispatcher dispatcher = request.getRequestDispatcher("semesterFees.jsp");
                //dispatcher.forward(request, response);

            } else if (res.equals("formfillup_page")) {

                adminFormFillUpFeesTable formfillupfee;

                formfillupfee = mainController.findFormfillupFee(departmentId, semester);

                System.out.println(formfillupfee.getMain_fee() + " " + formfillupfee.getMisce_fee());

                request.setAttribute("mainfee", formfillupfee.getMain_fee());
                request.setAttribute("miscefee", formfillupfee.getMisce_fee());

                request.getRequestDispatcher("formFillUp.jsp").forward(request, response);


            } else {

                response.sendRedirect("payment.jsp?expire_date");
                System.out.println("line no 63");
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String test = request.getParameter("action");

        System.out.println("Action: " + test);

    }

}
