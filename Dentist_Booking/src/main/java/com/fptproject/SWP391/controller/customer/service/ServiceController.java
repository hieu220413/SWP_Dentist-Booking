/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.customer.service;

import com.fptproject.SWP391.manager.customer.ServiceManager;
import com.fptproject.SWP391.model.Service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "ServiceController", urlPatterns = {"/service/*"})
public class ServiceController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String path = request.getPathInfo();
        ArrayList<Service> list = null;
        ServiceManager manager = null;
        
        switch (path) {
            case "/list":
                list = new ArrayList<>();
                manager = new ServiceManager();
                list = manager.list();
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/service.jsp").forward(request, response);
                break;
                
            case "/sort":
                String type = request.getParameter("type");
                list = new ArrayList<Service>();
                manager = new ServiceManager();
                list = manager.sortByPrice(type);
                request.setAttribute("type", type);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/service.jsp").forward(request, response);
                break;
            case "/search":
                String name = request.getParameter("name");
                if(name.isEmpty() || name == null){
                    response.sendRedirect(request.getContextPath()+"/service/list");
                    break;
                }
                list = new ArrayList<Service>();
                manager = new ServiceManager();
                list = manager.search(name);
                if (list == null || list.size() < 1) {
                    request.setAttribute("searchMsg", "No services were found to match your search");
                }
                request.setAttribute("name", name);
                request.setAttribute("list", list);
                request.getRequestDispatcher("/customer/service.jsp").forward(request, response);
                break;    
            default:
                throw new AssertionError();
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
            Logger.getLogger(ServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ServiceController.class.getName()).log(Level.SEVERE, null, ex);
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
