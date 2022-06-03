/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.admin.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.admin.AdminCustomerManager;
import com.fptproject.SWP391.manager.admin.AdminDentistManager;
import com.fptproject.SWP391.manager.admin.AdminEmployeeManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "AdminCreateDentistController", urlPatterns = {"/admin/AdminCreateDentistController"})
public class AdminCreateDentistController extends HttpServlet {
        private static final String ERROR = "../admin/AdminSearchDentistController?search=";
        private static final String SUCCESS = "../admin/AdminSearchDentistController?search=";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DentistError dentistError = new DentistError();
        try {
            boolean checkError = false;
            Dentist dentist = new Dentist();
            AdminDentistManager daoDentist = new AdminDentistManager();
            AdminCustomerManager daoCustomer = new AdminCustomerManager();
            AdminEmployeeManager daoEmployee = new AdminEmployeeManager();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = "DENTIST";
            String personalName = request.getParameter("personalName");
            float rate = 5;
            byte gender = Byte.parseByte(request.getParameter("gender"));
            byte status = 1;
            String speciality = request.getParameter("speciality");
            String description = request.getParameter("description");
            String education = request.getParameter("education");
            int workingExperience = Integer.parseInt(request.getParameter("workingExperience"));
            String award = request.getParameter("award");
            String imageName = request.getParameter("image");
            if(username.trim().length() < 5 || username.trim().length() > 30){
                dentistError.setUsernameError("Username must be >= 5 and <=30 characters");
                checkError = true;
            }
            
            if(personalName.trim().length() < 5 || personalName.trim().length() > 30){
                dentistError.setPersonalNameError("Personal name must be >= 5 and <=30 characters");
                checkError = true;
            }
            
            
            if(password.length() < 8 || password.length() > 30){
                dentistError.setPasswordError("Password must be >=8 and <=30 characters");
                checkError = true;
            }
            else{
                Pattern pattern = Pattern.compile("[0-9]");
                Matcher m = pattern.matcher(password);
                boolean checknum = m.find();

                pattern = Pattern.compile("[a-z]");
                m = pattern.matcher(password);
                boolean checkWordDowncase = m.find();

                pattern = pattern.compile("[A-Z]");
                m = pattern.matcher(password);
                boolean checkWordUpcase = m.find();
                
                if((checknum & checkWordUpcase & checkWordDowncase) == false){
                    dentistError.setPasswordError("Password must include lowercase and uppercase letters, number");
                    checkError=true;
                }
            }
            
            if(daoDentist.checkDuplicate(username) || daoCustomer.checkDuplicate(username) || daoEmployee.checkDuplicate(username)){
                dentistError.setUsernameError("this username has already existed");
                checkError= true; 
            }
            
            if(description.trim().length() < 10 || description.trim().length() > 500){
                dentistError.setDescriptionError("Description must be >= 10 and <=500 characters");
                checkError = true;
            }
            
            if(education.trim().length() < 10 || education.trim().length() > 300){
                dentistError.setEducationError("Education must be >= 10 and <=300 characters");
                checkError = true;
            }
            
            if(award.trim().length() < 5 || award.trim().length() > 300){
                dentistError.setAwardError("Award must be >= 5 and <=300 characters");
                checkError = true;
            }
            
            if(checkError == false){
                String id = dentist.getDentistNextID(daoDentist.getMaxDentistID());
                String image = "assets/img/doctors/"+imageName;
                dentist = new Dentist(id, username.trim(), password, role, personalName.trim(), rate, gender, status, speciality, description.trim(), education.trim(), workingExperience, award.trim(), image);
                if(daoDentist.createDentist(dentist))
                    url=SUCCESS;
                    request.setAttribute("SUCCESS", "Create account success");
            }
            else{
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
            
            
            
        } catch (Exception e) {
            log("Error at AdminCreateDentist Controller: " + e.toString());
        } finally {
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
