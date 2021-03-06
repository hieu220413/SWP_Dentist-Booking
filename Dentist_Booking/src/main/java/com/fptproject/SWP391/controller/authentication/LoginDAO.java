/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.controller.authentication;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dangnguyen
 */
public class LoginDAO {
    //private static final String EMPLOYEE_LOGIN = "SELECT personal_name, id, role from Employees WHERE [username] = ? and [password] = ?";
      private static final String CUSTOMER_LOGIN = "SELECT * from Customers WHERE username = ? and password = ? and status != 0 and blacklist_status = 0";
      private static final String CUSTOMER_LOGIN_GG = "SELECT * from Customers WHERE email = ? and status != 0 and blacklist_status = 0";
      private static final String DENTIST_LOGIN = "SELECT * from Dentists WHERE [username] = ? and [password] = ? and status != 0 ";
      private static final String EMPLOYEE_LOGIN = "SELECT * from Employees WHERE [username] = ? and [password] = ? ";

    public Customer checkLoginEmailCustomer(String email) throws SQLException {
        Customer customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CUSTOMER_LOGIN_GG);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phone_number");
                    byte gender = rs.getByte("gender");
                    byte status =rs.getByte("status");
                    byte blacklistStatus =rs.getByte("blacklist_status");
                    String image = rs.getString("image");
                    
                    customer = new Customer(id, "", "", role, personalName, age, address, phoneNumber, email, gender, image, (byte) status, (byte) blacklistStatus);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return customer;
    }
    
    public Customer checkLoginCustomer(String username, String password) throws SQLException {
        Customer customer = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CUSTOMER_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    int age = rs.getInt("age");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phone_number");
                    String email = rs.getString("email");
                    byte gender = rs.getByte("gender");
                    byte status =rs.getByte("status");
                    byte blacklistStatus =rs.getByte("blacklist_status");
                    String image = rs.getString("image");
                    
                    customer = new Customer(id, username, password, role, personalName, age, address, phoneNumber, email, gender, image, (byte) status, (byte) blacklistStatus);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return customer;
    }

    public Dentist checkLoginDentist(String username, String password) throws SQLException {
        Dentist dentist = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DENTIST_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    Float rate = rs.getFloat("rate");
                    Byte gender = rs.getByte("gender");
                    String speciality = rs.getString("speciality");
                    String description = rs.getString("description");
                    String education = rs.getString("education");
                    int working_experience = rs.getInt("working_experience");
                    String award = rs.getString("award");
                    String image = rs.getString("image");
                    dentist = new Dentist(id, username, password, role, personalName, rate, gender, (byte) 1, speciality, description, education, working_experience, award, image);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dentist;
    }

    public Employee checkLoginEmployee(String username, String password) throws SQLException {
        Employee employee = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EMPLOYEE_LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String personalName = rs.getString("personal_name");
                    String id = rs.getString("id");
                    String role = rs.getString("role");
                    String phoneNumber = rs.getString("phone_number");
                    String email = rs.getString("email");
                    String image = rs.getString("image");
                    employee = new Employee(id, role, personalName, phoneNumber, email, image);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return employee;
    }
}
