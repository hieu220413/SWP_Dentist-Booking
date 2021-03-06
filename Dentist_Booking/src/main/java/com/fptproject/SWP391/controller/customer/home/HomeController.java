/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.home;

import com.fptproject.SWP391.manager.customer.DentistManager;
import com.fptproject.SWP391.manager.customer.PromotionManager;
import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.model.Dentist;
import com.fptproject.SWP391.model.Promotion;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
@WebServlet(name = "HomeController", urlPatterns = {"/home/mainpage"})
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //get managers
            PromotionManager promotionManager = new PromotionManager();
            DentistManager dentistManager = new DentistManager();
            ServiceManager serviceManager = new ServiceManager();
            
            List<Promotion> listPromotion = new ArrayList<>();
            //list services apply promotion
            ArrayList<Service> listServiceApplied = new ArrayList<>();

            //map for linking promotion and list of services apply promotion
            HashMap<Promotion, ArrayList<Service>> servicesApplied = new HashMap<>();

            //add value to list 
            for (Promotion promotion : promotionManager.list()) {
                listServiceApplied = promotionManager.listServiceApplied(promotion.getId());
                //check if promotion is applied by any service or not then add promotion to list and map
                if (listServiceApplied != null) {
                    listPromotion.add(promotion);
                    servicesApplied.put(promotion, listServiceApplied);
                }
            }
            
            List<Dentist> listDentist = new ArrayList<>();
            List<Service> listService = new ArrayList<>();
            listDentist = dentistManager.list();
            listService = serviceManager.list();
            
            request.setAttribute("listPromotion", listPromotion);
            request.setAttribute("listDentist", listDentist);
            request.setAttribute("listService", listService);
            request.getRequestDispatcher("/customer/index.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
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
