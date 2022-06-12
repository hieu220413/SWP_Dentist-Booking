/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.fptproject.SWP391.manager.customer;

import com.fptproject.SWP391.dbutils.DBUtils;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author dangnguyen
 */
public class AppointmentManager {

    public static final String LIST_SLOT = "SELECT AppDetail.id,AppDetail.slot, meeting_date\n"
            + "FROM Appointments,(SELECT id,slot FROM AppointmentDetail) as AppDetail\n"
            + "WHERE AppDetail.id = Appointments.id";
    public static final String LIST_IN_ONE_DAY = "  SELECT * FROM Appointments WHERE meeting_date = ? ;";
    public static final String INSERT = "INSERT INTO Appointments VALUES (?,?,?,?,?,?,?,?,?)";
    public static final String INSERT_APPOINTMENT_DETAIL = "INSERT INTO AppointmentDetail VALUES (?,?,?)";
  
    private final static String APPOINTMENT_LIST = "SELECT * FROM Appointments  \n"
            + "INNER JOIN Dentists ON Appointments.dentist_id = Dentists.id\n"
            + "WHERE Appointments.customer_id = ? ";
    private static final String GET_APPOINTMENT = "SELECT * FROM Appointments WHERE id=?";
    
    public Appointment getAppointmentForPurchase(String ID) throws SQLException{
        Appointment appointment = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_APPOINTMENT);
                ptm.setString(1, ID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String appointmentID = rs.getString("id");
                    String dentistID = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    appointment = new Appointment(ID, dentistID, meetingDate);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return appointment;      
    }
    
    public int getQuantityOfAppointmentInOneDay(Date date) throws SQLException{
        int quantity = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_IN_ONE_DAY);
                ptm.setDate(1, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    quantity++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return quantity;
    }

    public List<Appointment> getListAppointment(String customerID) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPOINTMENT_LIST);
                ptm.setString(1, customerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String dentistId = rs.getString("dentist_id");
                    Date meetingDate = rs.getDate("meeting_date");
                    String dentistNote = rs.getString("dentist_note");
                    String customerSymptom = rs.getString("customer_symptom");
                    int status = rs.getInt("status");
                    byte paymentConfirm = rs.getByte("payment_confirm");
                    byte dentistConfirm = rs.getByte("dentist_confirm");
                    String dentistPersonalName = rs.getString("personal_name");
                    String dentistRole = rs.getString("role");
                    String dentistImage = rs.getString("image");

                    Appointment appointment = new Appointment(id, dentistId, customerID, meetingDate, dentistNote, customerSymptom, status, paymentConfirm, dentistConfirm, dentistPersonalName, dentistRole, dentistImage);
                    list.add(appointment);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
        return list;
    }

    private boolean makeAppointmentDetail(AppointmentDetail appointmentDetail) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ptm = conn.prepareStatement(INSERT_APPOINTMENT_DETAIL);
            ptm.setString(1, appointmentDetail.getId());
            ptm.setString(2, appointmentDetail.getServiceId());
            ptm.setInt(3, appointmentDetail.getSlot());
            ptm.executeUpdate();
            check = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean makeAppointment(Appointment appointment, AppointmentDetail[] appointmentDetail) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        boolean checkDetail = false;
        try {
            conn = DBUtils.getConnection();
            if (conn == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ptm = conn.prepareStatement(INSERT);
            ptm.setString(1, appointment.getId());
            ptm.setString(2, appointment.getDentistId());
            ptm.setString(3, appointment.getCustomerId());
            ptm.setDate(4, appointment.getMeetingDate());
            ptm.setString(5, appointment.getDentistNote());
            ptm.setString(6, appointment.getCustomerSymptom());
            ptm.setInt(7, appointment.getStatus());
            ptm.setByte(8, appointment.getPaymentConfirm());
            ptm.setInt(9, appointment.getDentistConfirm());
            int row = ptm.executeUpdate();

            //add multiple service detail
            for (int i = 0; i < appointmentDetail.length; i++) {
                checkDetail = makeAppointmentDetail(appointmentDetail[i]);
            }

            if (checkDetail && row > 0) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public HashMap<AppointmentDetail,Date> listAppointmentTime() throws SQLException{
        HashMap<AppointmentDetail,Date> appointment = null;

        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn == null) {
                throw new NullPointerException("there isn't any database server connection");
            }
            ptm = conn.prepareStatement(LIST_SLOT);
            ResultSet rs = ptm.executeQuery();
            appointment = new HashMap<>();
            while (rs.next()) { 
                AppointmentDetail appDetail = new AppointmentDetail();
                appDetail.setId(rs.getString("id"));
                appDetail.setSlot(rs.getInt("slot"));
                appointment.put(appDetail,rs.getDate("meeting_date"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return appointment;
    }
}
