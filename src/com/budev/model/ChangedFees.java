package com.budev.model;

public class ChangedFees {

    private String id;
    private String roll;
    private String semester;
    private String changed_amount;
    private String department;

    public ChangedFees() {
        super();
    }

    public ChangedFees(String id, String roll, String semester, String changed_amount, String department) {
        super();
        this.id = id;
        this.roll = roll;
        this.semester = semester;
        this.changed_amount = changed_amount;
        this.department = department;
    }

    public ChangedFees(String roll, String semester, String changed_amount, String department) {
        super();
        this.roll = roll;
        this.semester = semester;
        this.changed_amount = changed_amount;
        this.department = department;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoll() {
        return roll;
    }

    public void setRoll(String roll) {
        this.roll = roll;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getChanged_amount() {
        return changed_amount;
    }

    public void setChanged_amount(String changed_amount) {
        this.changed_amount = changed_amount;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }


}
