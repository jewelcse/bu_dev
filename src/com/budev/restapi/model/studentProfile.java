package com.budev.restapi.model;

public class studentProfile {

    private String id;
    private String s_roll;
    private String s_reg;
    private String s_name;
    private String s_mother_name;
    private String s_father_name;
    private String s_email;
    private String s_faculty;
    private String s_department;
    private String s_semester;
    private String s_phone;
    private String s_password;
    public boolean valid;


    public studentProfile(String s_roll, String s_reg, String s_name, String s_mother_name, String s_father_name,
                          String s_email, String s_faculty, String s_department, String s_semester, String s_phone, String s_password,
                          boolean valid) {
        super();
        this.s_roll = s_roll;
        this.s_reg = s_reg;
        this.s_name = s_name;
        this.s_mother_name = s_mother_name;
        this.s_father_name = s_father_name;
        this.s_email = s_email;
        this.s_faculty = s_faculty;
        this.s_department = s_department;
        this.s_semester = s_semester;
        this.s_phone = s_phone;
        this.s_password = s_password;
        this.valid = valid;
    }

    public studentProfile(String id, String s_roll, String s_reg, String s_name, String s_mother_name,
                          String s_father_name, String s_email, String s_faculty, String s_department, String s_semester,
                          String s_phone, String s_password, boolean valid) {
        super();
        this.id = id;
        this.s_roll = s_roll;
        this.s_reg = s_reg;
        this.s_name = s_name;
        this.s_mother_name = s_mother_name;
        this.s_father_name = s_father_name;
        this.s_email = s_email;
        this.s_faculty = s_faculty;
        this.s_department = s_department;
        this.s_semester = s_semester;
        this.s_phone = s_phone;
        this.s_password = s_password;
        this.valid = valid;
    }

    public studentProfile() {
        // TODO Auto-generated constructor stub
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getS_roll() {
        return s_roll;
    }

    public void setS_roll(String s_roll) {
        this.s_roll = s_roll;
    }

    public String getS_reg() {
        return s_reg;
    }

    public void setS_reg(String s_reg) {
        this.s_reg = s_reg;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_mother_name() {
        return s_mother_name;
    }

    public void setS_mother_name(String s_mother_name) {
        this.s_mother_name = s_mother_name;
    }

    public String getS_father_name() {
        return s_father_name;
    }

    public void setS_father_name(String s_father_name) {
        this.s_father_name = s_father_name;
    }

    public String getS_email() {
        return s_email;
    }

    public void setS_email(String s_email) {
        this.s_email = s_email;
    }

    public String getS_faculty() {
        return s_faculty;
    }

    public void setS_faculty(String s_faculty) {
        this.s_faculty = s_faculty;
    }

    public String getS_department() {
        return s_department;
    }

    public void setS_department(String s_department) {
        this.s_department = s_department;
    }

    public String getS_semester() {
        return s_semester;
    }

    public void setS_semester(String s_semester) {
        this.s_semester = s_semester;
    }

    public String getS_phone() {
        return s_phone;
    }

    public void setS_phone(String s_phone) {
        this.s_phone = s_phone;
    }

    public String getS_password() {
        return s_password;
    }

    public void setS_password(String s_password) {
        this.s_password = s_password;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }


}
