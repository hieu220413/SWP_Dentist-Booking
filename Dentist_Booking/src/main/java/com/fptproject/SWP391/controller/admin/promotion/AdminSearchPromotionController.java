/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.promotion;

import com.fptproject.SWP391.manager.admin.AdminPromotionManager;
import com.fptproject.SWP391.model.Promotion;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminSearchPromotionController", urlPatterns = {"/admin/AdminSearchPromotionController"})
public class AdminSearchPromotionController extends HttpServlet {
    private static final String ERROR= "/admin/promotion-management.jsp";
    private static final String SUCCESS= "/admin/promotion-management.jsp";      
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            String search = request.getParameter("search");
            if(search == null){
                search = (String) request.getAttribute("SEARCH");
            }
            AdminPromotionManager dao = new AdminPromotionManager(); 
            List<Promotion> promotionList = dao.searchListPromotion(search);
            request.setAttribute("SEARCH", search);
            if(promotionList.size()>0){
                request.setAttribute("LIST_PROMOTION", promotionList);
                url= SUCCESS;
            }
        }catch(Exception e){
            log("Error at AdminSearchPrmotion Controller: " + e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
