/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Customer;
import com.fptproject.SWP391.model.Dentist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AdminCustomerManager {
    private static final String SELECT = "SELECT * FROM Customers WHERE username=?";
    private static final String SEARCH = "SELECT * FROM Dentists WHERE personal_name LIKE ? ";
    public boolean checkDuplicate(String username) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SELECT);
                ptm.setString(1,username);
                rs = ptm.executeQuery();
                if(rs.next()){
                    check=true;
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public List<Customer> searchListCustomer(String search) throws SQLException{
        List customerList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+search+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id= rs.getString("id");
                    String personalName= rs.getString("personal_name");
                    float rate = rs.getFloat("rate");
                    String speciality = rs.getString("speciality");
                    String image = rs.getString("image");
                    byte gender = rs.getByte("gender");
                    byte status = rs.getByte("status");
                    dentistList.add(new Dentist(id, personalName, rate, gender, status, speciality, image));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return dentistList;
    }
}
