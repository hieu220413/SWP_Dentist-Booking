/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fptproject.SWP391.controller.dentist;

import com.fptproject.SWP391.error.DentistError;
import com.fptproject.SWP391.manager.dentist.DentistManager;
import com.fptproject.SWP391.model.Dentist;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author minha
 */
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/dentist/UpdateProfile"})
public class UpdateProfileController extends HttpServlet {

    private static final String ERROR = "../dentist/dentist-profile-settings.jsp";
    private static final String SUCCESS = "../dentist/dentist-profile-settings.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Dentist dentist = (Dentist) session.getAttribute("Login_Dentist");
            DentistManager dao = new DentistManager();
            DentistError dentistError = new DentistError();
            
            String personalName = "";//request.getParameter("personalName");
            byte gender = 0;//Byte.parseByte(request.getParameter("gender"));
            String speciality = "";//request.getParameter("speciality");
            String description = "";//request.getParameter("description");
            String education = "";//request.getParameter("education");
            int workingExperience = 0;//Integer.parseInt(request.getParameter("workingExperience"));
            String award = "";//request.getParameter("award");
            String image = "";//request.getParameter("image");
            
            // up load image
            String imgPathTmp = null;
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            ServletContext context = request.getServletContext();
            String filePath = context.getInitParameter("file-upload-admin-doctors-folder");//take the path file from web.xml
            // Verify the content type
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);

                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("D:/Chuyen nganh/SWP391/SWP_Dentist-Booking/Dentist_Booking/src/main/webapp/dentist/assets/img/doctors/"));

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (fi.isFormField()) {
                            // get the uploaded file's fields
                            if (fi.getFieldName().equals("personalName")) {
                                personalName = fi.getString();
                            }
                            if (fi.getFieldName().equals("gender")) {
                                String genderString = fi.getString();
                                if (genderString.equals("Male")) {
                                    gender = 0;
                                } else {
                                    gender = 1;
                                }
                            }
                            if (fi.getFieldName().equals("speciality")) {
                                speciality = fi.getString();
                            }
                            if (fi.getFieldName().equals("description")) {
                                description = fi.getString();
                            }
                            if (fi.getFieldName().equals("education")) {
                                education = fi.getString();
                            }
                            if (fi.getFieldName().equals("workingExperience")) {
                                workingExperience = Integer.parseInt(fi.getString());
                            }
                            if (fi.getFieldName().equals("award")) {
                                award = fi.getString();
                            }

                        } else {
                            //process write file to disk
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            // filePath += group + "/" + cmanager.ConvertStringtoName(category) + "/";
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            image = fi.getName();
                            String testImage = "assets/img/doctors/"+ image;
                            // Write the file
                            if(!image.isEmpty() && !testImage.equals(dentist.getImage())){
                                if (fileName.lastIndexOf("\\") >= 0) {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\")));
                                } else {
                                    file = new File(filePath
                                            + fileName.substring(fileName.lastIndexOf("\\") + 1));
                                }
                                //get the img path for saving to database
                                imgPathTmp = file.getAbsolutePath();
                                fi.write(file);
                                String tmp[] = imgPathTmp.split("\\\\");
                                image = tmp[tmp.length - 4] + "/" + tmp[tmp.length - 3] + "/" + tmp[tmp.length - 2] + "/" + tmp[tmp.length - 1];
                            }
                        }

                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }
            //create imgpath
  
            
            // end updload image
           
            if (image.isEmpty()) {
                image = dentist.getImage();
            }
            if (!image.contains("assets/img/doctors/")) {
                image = "assets/img/doctors/" + image;
            }
            if (dao.updateProfile(personalName, gender, speciality, description, education, workingExperience, award, image, dentist.getUsername())) {
                request.setAttribute("SUCCESS", "Updated successfully");
                dentist.setPersonalName(personalName);
                dentist.setGender(gender);
                dentist.setSpeciality(speciality);
                dentist.setDescription(description);
                dentist.setEducation(education);
                dentist.setWorkingExperience(workingExperience);
                dentist.setAward(award);
                dentist.setImage(image);
                session.setAttribute("Login_Dentist", dentist);
                url = SUCCESS;
            } else {
                request.setAttribute("DENTIST_ERROR", dentistError);
            }
        } catch (Exception e) {
            log("Error at Update Profile Controller" + e.toString());
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
