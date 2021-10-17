package com.budev.sslcommerz;

import com.budev.Utility.ParameterBuilder;
import com.budev.model.Devfees;
import com.budev.model.FormfillupFees;
import com.budev.model.SemesterFees;
import com.budev.model.Student;

import java.util.Map;

public class TransactionInitiator {

    String storeId = "testbox";
    String storePass = "qwerty";

    public String initTrnxnRequest(Student student, Devfees devfees) {
        String response = "";
        try {
            /**
             * All parameters in payment order should be constructed in this follwing postData Map
             * keep an eye on success fail url correctly.
             * insert your success and fail URL correctly in this Map
             */
            Map<String, String> postData = ParameterBuilder.constructRequestParameters(student, devfees);

            //	 Map<String, String> postData = ParameterBuilder.constructRequestParameters();
            /**
             * Provide your SSL Commerz store Id and Password by this following constructor.
             * If Test Mode then insert true and false otherwise.
             */
            //SSLCommerz sslcz = new SSLCommerz("bupaymentslive", "5E662CA68865573443", false);
            SSLCommerz sslcz = new SSLCommerz(storeId, storePass, true);

            /**
             * If user want to get Gate way list then pass isGetGatewayList parameter as true
             * If user want to get URL as returned response, pass false.
             */
            response = sslcz.initiateTransaction(postData, false);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }

    public String initTrnxnRequest(Student student, SemesterFees semfee) {

        String response = "";
        try {
            Map<String, String> postData = ParameterBuilder.constructRequestParameters(student, semfee);
            SSLCommerz sslcz = new SSLCommerz(storeId, storePass, true);
            response = sslcz.initiateTransaction(postData, false);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;

    }

    public String initTrnxnRequest(Student student, FormfillupFees formfillupfee) {
        String response = "";
        try {

            Map<String, String> postData = ParameterBuilder.constructRequestParameters(student, formfillupfee);
            SSLCommerz sslcz = new SSLCommerz(storeId, storePass, true);
            response = sslcz.initiateTransaction(postData, false);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return response;
    }


}
