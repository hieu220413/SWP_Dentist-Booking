/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.model;

/**
 *
 * @author admin
 */
public class DentistAvailableTime {
    private String dentistId;
    private int slot;
    private String day;
    private byte availableStatus;

    public DentistAvailableTime() {
    }

    public DentistAvailableTime(String dentistId, int slot, String day, byte availableStatus) {
        this.dentistId = dentistId;
        this.slot = slot;
        this.day = day;
        this.availableStatus = availableStatus;
    }

    public DentistAvailableTime(String dentistId, int slot, String day) {
        this.dentistId = dentistId;
        this.slot = slot;
        this.day = day;
    }

    public String getDentistId() {
        return dentistId;
    }

    public int getSlot() {
        return slot;
    }

    public String getDay() {
        return day;
    }

    public byte getAvailableStatus() {
        return availableStatus;
    }

    public void setDentistId(String dentistId) {
        this.dentistId = dentistId;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public void setAvailableStatus(byte availableStatus) {
        this.availableStatus = availableStatus;
    }
    
    
    
}
