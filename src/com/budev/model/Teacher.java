package com.budev.model;

public class Teacher {

    private String id;
    private String name;
    private String imageUrl;
    private String designation;
    private int departmentId;
    private String highestEducationLevel;
    private String cellNumber;
    private String email;
    private String password;
    private String profileBody;

    public Teacher() {
    }

    public Teacher(String name, String imageUrl, String designation, int departmentId, String highestEducationLevel, String cellNumber, String email, String password,String profileBody) {
        this.name = name;
        this.imageUrl = imageUrl;
        this.designation = designation;
        this.departmentId = departmentId;
        this.highestEducationLevel = highestEducationLevel;
        this.cellNumber = cellNumber;
        this.email = email;
        this.password = password;
        this.profileBody = profileBody;
    }

    public String getProfileBody() {
        return profileBody;
    }

    public void setProfileBody(String profileBody) {
        this.profileBody = profileBody;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getHighestEducationLevel() {
        return highestEducationLevel;
    }

    public void setHighestEducationLevel(String highestEducationLevel) {
        this.highestEducationLevel = highestEducationLevel;
    }

    public String getCellNumber() {
        return cellNumber;
    }

    public void setCellNumber(String cellNumber) {
        this.cellNumber = cellNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
