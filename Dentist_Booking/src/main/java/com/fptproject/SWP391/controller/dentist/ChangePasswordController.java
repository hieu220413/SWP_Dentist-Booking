/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.dentist.DentistManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author minha
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/dentist/DentistChangePassword"})
public class ChangePasswordController extends HttpServlet {
    private static final String ERROR = "../dentist/dentist-change-password.jsp";
    private static final String SUCCESS = "../dentist/dentist-change-password.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try{
            HttpSession session= request.getSession();
            Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            DentistError dentistError = new DentistError();
            DentistManager dao = new DentistManager();
            boolean checkError = false;
            if(oldPassword.equals(dentist.getPassword())==false) {
                dentistError.setOldPasswordError("Current password is incorrect");
                checkError = true;
            }
            if (newPassword.length() < 8 || newPassword.length() > 30){
                dentistError.setNewPasswordError("Number of words >=8 and <=30");
                checkError = true;
            }
            else{
                Pattern pattern = Pattern.compile("[0-9]");
                Matcher m = pattern.matcher(newPassword);
                boolean checknum = m.find();

                pattern = Pattern.compile("[a-z]");
                m = pattern.matcher(newPassword);
                boolean checkWordDowncase = m.find();

                pattern = pattern.compile("[A-Z]");
                m = pattern.matcher(newPassword);
                boolean checkWordUpcase = m.find();
                
                if((checknum & checkWordUpcase & checkWordDowncase) == false){
                    dentistError.setNewPasswordError("Password must include Uppercase and Lowercase");
                    checkError=true;
                }           
            }
            if(confirmPassword.equals(newPassword)==false) {
                    dentistError.setConfirmPasswordError("Confirm Password is different");
                    checkError=true;
                }
            
            if(checkError==false){
                dao.updatePassword(dentist.getUsername(), newPassword);
                request.setAttribute("SUCCESS", "Updated successfully");
                dentist.setPassword(newPassword);
                session.setAttribute("Login_Dentist", dentist);
                url= SUCCESS;
            }else{
                request.setAttribute("oldPassword", oldPassword);
                request.setAttribute("newPassword", newPassword);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
        }catch (Exception e){
            log("Error at Change Password Controller"+e.toString());
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
