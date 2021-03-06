/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.admin;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Promotion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class AdminPromotionManager {
    private static final String CREATE = "INSERT INTO Promotions (id, promotion_name, long_description, short_description, image, discount_percentage, expired_date, status) VALUES (?,?,?,?,?,ROUND(?, 2),?,?)";
    private static final String SELECT_MAX_PROMOTION_ID= "SELECT MAX(id) as maxPromotionID FROM Promotions WHERE LEN(id) = (SELECT MAX(LEN(id)) FROM Promotions)";
    private static final String SELECT_ALL_ACTIVE_ID = "SELECT id FROM Promotions, (SELECT CAST( GETDATE() AS Date ) as now) as CurrentDate WHERE status=1 AND expired_date > CurrentDate.[now] ";
    private static final String SEARCH = "SELECT * FROM Promotions WHERE promotion_name LIKE ? ";
    private static final String UPDATE = "UPDATE Promotions SET promotion_name = ?, long_description = ?, short_description = ?, image = ?, discount_percentage = ROUND(?, 2), expired_date = ? WHERE id = ?";
    private static final String DELETE = "UPDATE Promotions SET status = 0 WHERE id=?";
    private static final String RESTORE = "UPDATE Promotions SET status = 1 WHERE id=?";
    private static final String GET_OUT_DATED_PROMOTION = "SELECT * FROM Promotions,(SELECT CAST( GETDATE() AS Date ) as now) as CurrentDate WHERE expired_date < CurrentDate.[now] ";
    public String getMaxPromotionID() throws SQLException{
        String maxPromotionID="";
        Connection conn=null;
        PreparedStatement ptm=null;
        ResultSet rs=null;
        try{
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm= conn.prepareStatement(SELECT_MAX_PROMOTION_ID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    if(rs.getString("maxPromotionID") == null){
                        maxPromotionID="PR0";
                    }
                    else{
                        maxPromotionID= rs.getString("maxPromotionID");
                    }
                }          
            }           
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();           
        }
        return maxPromotionID;
    }
    
    public List<String> getAllPromotion() throws SQLException{
        List promotionIDList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(SELECT_ALL_ACTIVE_ID);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id= rs.getString("id");
                    promotionIDList.add(id);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return promotionIDList;
    }
    
    public List<String> getAllOutDatePromotion() throws SQLException{
        List promotionIDList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(GET_OUT_DATED_PROMOTION);
                rs = ptm.executeQuery();
                while(rs.next()){
                    String id= rs.getString("id");
                    promotionIDList.add(id);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return promotionIDList;
    }
    
    public boolean createPromotion(Promotion promotion) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(CREATE);
                ptm.setString(1,promotion.getId());
                ptm.setString(2,promotion.getPromotionName());
                ptm.setString(3,promotion.getLongDescription());
                ptm.setString(4,promotion.getShortDescription());
                ptm.setString(5,promotion.getImage());
                ptm.setFloat(6,promotion.getDiscountPercentage());
                ptm.setDate(7,promotion.getExpiredDate());
                ptm.setByte(8,promotion.getStatus());
                check= ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    public List<Promotion> searchListPromotion(String search) throws SQLException{
        List promotionList = new ArrayList<>();
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
                    String promotionName= rs.getString("promotion_name");
                    String shortDescription = rs.getString("short_description");
                    String longDescription = rs.getString("long_description");
                    Date expiredDate = rs.getDate("expired_date");
                    float discountPercentage = rs.getFloat("discount_percentage");
                    String image = rs.getString("image");
                    byte status = rs.getByte("status");
                    promotionList.add(new Promotion(id, promotionName, longDescription, shortDescription, image, discountPercentage, expiredDate, status));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return promotionList;
    }
    
    public boolean updatePromotion(Promotion promotion) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1,promotion.getPromotionName());
                ptm.setString(2,promotion.getLongDescription());
                ptm.setString(3,promotion.getShortDescription());
                ptm.setString(4,promotion.getImage());
                ptm.setFloat(5,promotion.getDiscountPercentage());
                ptm.setDate(6,promotion.getExpiredDate());
                ptm.setString(7,promotion.getId());
                check= ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    public boolean deletePromotion(String ID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1,ID);
                check = ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public boolean restorePromotion(String ID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try{        
            conn= DBUtils.getConnection();
            if(conn!=null){
                ptm = conn.prepareStatement(RESTORE);
                ptm.setString(1,ID);
                check = ptm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(ptm!=null) ptm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
}
