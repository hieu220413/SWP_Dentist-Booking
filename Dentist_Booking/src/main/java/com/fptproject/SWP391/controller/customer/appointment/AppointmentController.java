/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.appointment;

import com.fptproject.SWP391.manager.customer.AppointmentManager;
import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.manager.dentist.ScheduleManager;
import com.fptproject.SWP391.model.Appointment;
import com.fptproject.SWP391.model.AppointmentDetail;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.DentistAvailiableTime;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hieunguyen
 */
@WebServlet(name = "AppointmentController", urlPatterns = {"/appointment/*"})
public class AppointmentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String path = request.getPathInfo();
        switch (path) {
            case "/bookingDentist":
                bookingDentist(request, response);
                break;
            case "/book":
                book(request, response);
                break;
            default:
                throw new AssertionError();
        }

    }

    protected void book(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
//        String customerEmail = request.getParameter("customerEmail");
//        String customerPhone = request.getParameter("customerPhone");
//        String customerName = request.getParameter("customerName");

        //get parameter
        String id = "AP1";
        String dentistId = request.getParameter("dentistId");
        String customerId = request.getParameter("customerId");

        //convert String to LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/M/yyyy");
        String date = request.getParameter("date");
        LocalDate localDate = LocalDate.parse(date, formatter);
        
        Date meetingDate = Date.valueOf(localDate);
       

        String customerSymtom = request.getParameter("customerSymtom");
        String[] serviceId = request.getParameterValues("serviceId");
        String[] slot = request.getParameterValues("slot");
        int e  = slot[0].length() - 1;
        byte confirm = 0;
        AppointmentDetail[] appointmentDetail = new AppointmentDetail[2];
        Appointment appointment = new Appointment(id, dentistId, customerId, meetingDate, customerSymtom, 0, confirm, confirm);
        for (int i = 0; i < serviceId.length; i++) {            
            appointmentDetail[i] = new AppointmentDetail(id, serviceId[i], Integer.valueOf(String.valueOf(slot[i].charAt(e))));
        }
        AppointmentManager appointmentManager = new AppointmentManager();
        boolean check = appointmentManager.makeAppointment(appointment, appointmentDetail);
        if (check) {
            request.setAttribute("appointmentMsg", "Book appointment successfully!!");
        }
        request.getRequestDispatcher("/customer/book-appointment.jsp");
    }

    protected void bookingDentist(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        //load available slot of dentist
        String dentistId = request.getParameter("dentistId");

        List<DentistAvailiableTime> mondaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> tuesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> wednesdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> thursdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> fridaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> saturdaySchedule = new ArrayList<>();
        List<DentistAvailiableTime> sundaySchedule = new ArrayList<>();

        //load slots in each day of week from dtb
        ScheduleManager manager = new ScheduleManager();
        mondaySchedule = manager.show(dentistId, "Monday");
        tuesdaySchedule = manager.show(dentistId, "Tuesday");
        wednesdaySchedule = manager.show(dentistId, "Wednesday");
        thursdaySchedule = manager.show(dentistId, "Thursday");
        fridaySchedule = manager.show(dentistId, "Friday");
        saturdaySchedule = manager.show(dentistId, "Saturday");
        sundaySchedule = manager.show(dentistId, "Sunday");

        //send slots in each day of week to dentist-upload-schedule.jsp page
        request.setAttribute("mondaySchedule", mondaySchedule);
        request.setAttribute("tuesdaySchedule", tuesdaySchedule);
        request.setAttribute("wednesdaySchedule", wednesdaySchedule);
        request.setAttribute("thursdaySchedule", thursdaySchedule);
        request.setAttribute("fridaySchedule", fridaySchedule);
        request.setAttribute("saturdaySchedule", saturdaySchedule);
        request.setAttribute("sundaySchedule", sundaySchedule);

        List<Dentist> listDentists = new ArrayList<>();
        DentistManager dentistManager = new DentistManager();
        listDentists = dentistManager.list();
        request.setAttribute("dentists", listDentists);
        request.setAttribute("dentistId", dentistId);

        List<Service> listService = new ArrayList<>();
        ServiceManager serviceManager = new ServiceManager();
        listService = serviceManager.list();
        request.setAttribute("services", listService);
        request.getRequestDispatcher("/customer/book-appointment.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AppointmentController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
