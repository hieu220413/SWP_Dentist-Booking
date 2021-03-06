<%-- 
    Document   : profile-sidebar
    Created on : May 21, 2022, 3:57:49 PM
    Author     : hieunguyen
--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page import="com.fptproject.SWP391.model.Customer"%>
            <%@page contentType="text/html" pageEncoding="UTF-8"%>
                <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                    <div class="profile-sidebar">
                        <div class="widget-profile pro-widget-content">
                            <div class="profile-info-widget">
                                <a href="#" class="booking-doc-img">
                                    <img src="<%= request.getContextPath() %>/customer/${sessionScope.Login_Customer.image}" alt="User Image">
                                </a>
                                <div class="profile-det-info">

                                    <h3>
                                        <% Customer customer = (Customer)session.getAttribute("Login_Customer");%>
                                            <%=customer.getPersonalName() %>
                                    </h3>
                                    <div class="patient-details">
                                        <h5>Patient</h5>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="dashboard-widget">
                            <nav class="dashboard-menu">
                                <ul>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/ViewAppointmentController">
                                            <i class="fas fa-columns"></i>
                                            <span>Appointment</span>
                                        </a>
                                    </li>
<!--                                    <li>
                                        <a href="<%=request.getContextPath()%>/customer/chat.jsp">
                                            <i class="fas fa-comments"></i>
                                            <span>Message</span>
                                            <small class="unread-msg">23</small>
                                        </a>
                                    </li>-->
                                    <li>
                                        <a href="<%=request.getContextPath()%>/customer/profile-settings.jsp">
                                            <i class="fas fa-user-cog"></i>
                                            <span>Profile Settings</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/customer/change-password.jsp">
                                            <i class="fas fa-lock"></i>
                                            <span>Change Password</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%= request.getContextPath() %>/ViewInvoiceController">
                                            <i class="fas fa-lock"></i>
                                            <span>Invoice</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="<%=request.getContextPath()%>/LogoutController"">
                                            <i class="fas fa-sign-out-alt"></i>
                                            <span>Logout</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>