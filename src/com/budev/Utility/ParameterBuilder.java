package com.budev.Utility;

import com.budev.model.Devfees;
import com.budev.model.FormfillupFees;
import com.budev.model.SemesterFees;
import com.budev.model.Student;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class ParameterBuilder {

    static String baseUrl = "http://localhost:8080/";

    public static String getParamsString(Map<String, String> params, boolean urlEncode)
            throws UnsupportedEncodingException {
        StringBuilder result = new StringBuilder();

        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (urlEncode)
                result.append(URLEncoder.encode(entry.getKey(), "UTF-8"));
            else
                result.append(entry.getKey());

            result.append("=");
            if (urlEncode)
                result.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
            else
                result.append(entry.getValue());
            result.append("&");
        }

        String resultString = result.toString();
        return resultString.length() > 0 ? resultString.substring(0, resultString.length() - 1) : resultString;
    }


    public static Map<String, String> constructRequestParameters(Student student, Devfees devfees) {
        // CREATING LIST OF POST DATA

        // String baseUrl =
        // "http://103.28.121.29:8080/DevelopmentFees/";//Request.Url.Scheme + "://" +
        // Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";

        Map<String, String> postData = new HashMap<String, String>();
        postData.put("total_amount", devfees.getAmount());
        postData.put("tran_id", devfees.getTransId());
        postData.put("success_url", baseUrl + "paymentStatus?action=developmentfee&transid=" + devfees.getTransId() + "&deptId=" + devfees.getDepartmentId() + "&stuId=" + devfees.getStudentId() + "&semester=" + devfees.getSemester());
        postData.put("fail_url", baseUrl + "fail.jsp");
        postData.put("cancel_url", "https://sandbox.sslcommerz.com/developer/cancel.php");
        postData.put("version", "3.00");
		/*postData.put("stu_id", devfees.getStudentId());
		postData.put("stu_dept", devfees.getDepartmentId());
		postData.put("stu_semester", devfees.getSemester());*/

        return postData;
    }


    public static Map<String, String> constructRequestParameters(Student student, SemesterFees semfee) {

        //String baseUrl = "http://localhost:4444/DevelopmentFees/";
        Map<String, String> postData = new HashMap<String, String>();
        postData.put("total_amount", semfee.getAmount());
        postData.put("tran_id", semfee.getTransId());
        postData.put("success_url", baseUrl + "paymentStatus?action=semesterfee&transid=" + semfee.getTransId() + "&deptId=" + semfee.getDepartmentId() + "&stuId=" + semfee.getStudentId() + "&semester=" + semfee.getSemester());
        postData.put("fail_url", baseUrl + "fail.jsp");
        postData.put("cancel_url", "https://sandbox.sslcommerz.com/developer/cancel.php");
        postData.put("version", "3.00");

        return postData;
    }


    public static Map<String, String> constructRequestParameters(Student student, FormfillupFees formfillupfee) {

        //String baseUrl = "http://localhost:4444/DevelopmentFees/";
        Map<String, String> postData = new HashMap<String, String>();
        postData.put("total_amount", formfillupfee.getAmount());
        postData.put("tran_id", formfillupfee.getTransId());
        postData.put("success_url", baseUrl + "paymentStatus?action=formfillupfee&transid=" + formfillupfee.getTransId() + "&deptId=" + formfillupfee.getDepartmentId() + "&stuId=" + formfillupfee.getStudentId() + "&semester=" + formfillupfee.getSemester());
        postData.put("fail_url", baseUrl + "fail.jsp");
        postData.put("cancel_url", "https://sandbox.sslcommerz.com/developer/cancel.php");
        postData.put("version", "3.00");
		/*postData.put("stu_id", devfees.getStudentId());
		postData.put("stu_dept", devfees.getDepartmentId());
		postData.put("stu_semester", devfees.getSemester());*/

        return postData;
    }


}
