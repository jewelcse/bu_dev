package com.budev.model;

public class adminSemesterFeesTable {
    private String id;
    private String department;
    private String semester;
    private String semester_admission_fee;
    private String tution_fee;
    private String lab_or_seminar_fee;
    private String transport_fee;
    private String misce_fee;
    private String start_date;
    private String end_date;

    public adminSemesterFeesTable() {
        super();
    }

    public adminSemesterFeesTable(String id, String department, String semester, String semester_admission_fee,
                                  String tution_fee, String lab_or_seminar_fee, String transport_fee, String misce_fee, String start_date,
                                  String end_date) {
        super();
        this.id = id;
        this.department = department;
        this.semester = semester;
        this.semester_admission_fee = semester_admission_fee;
        this.tution_fee = tution_fee;
        this.lab_or_seminar_fee = lab_or_seminar_fee;
        this.transport_fee = transport_fee;
        this.misce_fee = misce_fee;
        this.start_date = start_date;
        this.end_date = end_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getSemester_admission_fee() {
        return semester_admission_fee;
    }

    public void setSemester_admission_fee(String semester_admission_fee) {
        this.semester_admission_fee = semester_admission_fee;
    }

    public String getTution_fee() {
        return tution_fee;
    }

    public void setTution_fee(String tution_fee) {
        this.tution_fee = tution_fee;
    }

    public String getLab_or_seminar_fee() {
        return lab_or_seminar_fee;
    }

    public void setLab_or_seminar_fee(String lab_or_seminar_fee) {
        this.lab_or_seminar_fee = lab_or_seminar_fee;
    }

    public String getTransport_fee() {
        return transport_fee;
    }

    public void setTransport_fee(String transport_fee) {
        this.transport_fee = transport_fee;
    }

    public String getMisce_fee() {
        return misce_fee;
    }

    public void setMisce_fee(String misce_fee) {
        this.misce_fee = misce_fee;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

}
