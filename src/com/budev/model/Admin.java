package com.budev.model;

public class Admin {

    private String id;
    private String name;
    private String password;
    private String item1;
    private String item2;
    private String item3;
    private String item4;
    private String item5;
    private String item6;
    private String adminType;
    public boolean superAdminIsvalid;
    public boolean subAdminIsvalid;

    public Admin(String id, String name, String password) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
    }


    public String getId() {
        return id;
    }


    public String getItem1() {
        return item1;
    }


    public void setItem1(String item1) {
        this.item1 = item1;
    }


    public String getItem2() {
        return item2;
    }


    public void setItem2(String item2) {
        this.item2 = item2;
    }


    public String getItem3() {
        return item3;
    }


    public void setItem3(String item3) {
        this.item3 = item3;
    }


    public String getItem4() {
        return item4;
    }


    public void setItem4(String item4) {
        this.item4 = item4;
    }


    public String getItem5() {
        return item5;
    }


    public void setItem5(String item5) {
        this.item5 = item5;
    }


    public String getItem6() {
        return item6;
    }


    public void setItem6(String item6) {
        this.item6 = item6;
    }


    public Admin(String id, String name, String password, String adminType, boolean superAdminIsvalid, boolean subAdminIsvalid) {
        super();
        this.id = id;
        this.name = name;
        this.password = password;
        this.adminType = adminType;
        this.superAdminIsvalid = superAdminIsvalid;
        this.subAdminIsvalid = subAdminIsvalid;
    }


    public String getAdminType() {
        return adminType;
    }


    public void setAdminType(String adminType) {
        this.adminType = adminType;
    }


    public void setId(String id) {
        this.id = id;
    }


    public Admin() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public boolean isSuperAdminIsvalid() {
        return superAdminIsvalid;
    }


    public void setSuperAdminIsvalid(boolean superAdminIsvalid) {
        this.superAdminIsvalid = superAdminIsvalid;
    }


    public boolean isSubAdminIsvalid() {
        return subAdminIsvalid;
    }


    public void setSubAdminIsvalid(boolean subAdminIsvalid) {
        this.subAdminIsvalid = subAdminIsvalid;
    }


}
