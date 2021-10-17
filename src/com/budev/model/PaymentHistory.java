package com.budev.model;

import java.time.LocalDateTime;

public class PaymentHistory {

    private String id;
    private String studentId;
    private String departmentId;
    private String semester;
    private String amount;
    private String feeType;
    private boolean paymentStatus;
    private LocalDateTime cDate = LocalDateTime.now();


    public PaymentHistory() {
        super();
    }


    public PaymentHistory(String id, String studentId, String departmentId, String semester, String amount,
                          String feeType, boolean paymentStatus) {
        super();
        this.id = id;
        this.studentId = studentId;
        this.departmentId = departmentId;
        this.semester = semester;
        this.amount = amount;
        this.feeType = feeType;
        this.paymentStatus = paymentStatus;
    }


    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id;
    }


    public String getStudentId() {
        return studentId;
    }


    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }


    public String getDepartmentId() {
        return departmentId;
    }


    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }


    public String getSemester() {
        return semester;
    }


    public void setSemester(String semester) {
        this.semester = semester;
    }


    public String getAmount() {
        return amount;
    }


    public void setAmount(String amount) {
        this.amount = amount;
    }


    public String getFeeType() {
        return feeType;
    }


    public void setFeeType(String feeType) {
        this.feeType = feeType;
    }


    public boolean isPaymentStatus() {
        return paymentStatus;
    }


    public void setPaymentStatus(boolean paymentStatus) {
        this.paymentStatus = paymentStatus;
    }


    public LocalDateTime getcDate() {
        return cDate;
    }
}
