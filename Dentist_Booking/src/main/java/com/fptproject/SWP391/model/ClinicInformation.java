/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

import java.sql.Time;

/**
 *
 * @author admin
 */
public class ClinicInformation {
    private String name;
    private String address;
    private String phone;
    private String email;
    private Time openTime;
    private Time closeTIme;

    public ClinicInformation() {
    }
    
    

    public ClinicInformation(String name, String address, String phone, String email, Time openTime, Time closeTIme) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.openTime = openTime;
        this.closeTIme = closeTIme;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public Time getOpenTime() {
        return openTime;
    }

    public Time getCloseTIme() {
        return closeTIme;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setOpenTime(Time openTime) {
        this.openTime = openTime;
    }

    public void setCloseTIme(Time closeTIme) {
        this.closeTIme = closeTIme;
    }
    
}
