package com.budev.model;

public class allApplication {
    private String id;
    private String semester;
    private String subject;
    private String feeType;
    private String reason;
    private String student_id;
    private String dept;

    public allApplication() {
        super();
    }

    public allApplication(String id, String semester, String subject, String feeType, String reason, String student_id,
                          String dept) {
        super();
        this.id = id;
        this.semester = semester;
        this.subject = subject;
        this.feeType = feeType;
        this.reason = reason;
        this.student_id = student_id;
        this.dept = dept;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getFeeType() {
        return feeType;
    }

    public void setFeeType(String feeType) {
        this.feeType = feeType;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

}
