<%@page import="com.fptproject.SWP391.model.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <%
        Employee admin = (Employee) session.getAttribute("Login_Employee");
        if (admin == null || !admin.getRole().equals("ADMIN")){
            response.sendRedirect("/dentalclinic/login.jsp");
            return;
        }
    %>
    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Dentist Management</title>

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Feathericon CSS -->
        <link rel="stylesheet" href="assets/css/feathericon.min.css">

        <!-- Datatables CSS -->
        <link rel="stylesheet" href="assets/plugins/datatables/datatables.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/customer/assets/css/style.css" />
        <link rel="stylesheet" href="assets/css/style.css">

        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Header -->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!-- /Header -->

                <!-- Sidebar -->
            <jsp:include flush="true" page="sidebar.jsp"></jsp:include>
                <!-- /Sidebar -->

                <!-- Page Wrapper -->
                <div class="page-wrapper">
                    <div class="content container-fluid">

                        <!-- Page Header -->
                        <div class="page-header">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3 class="page-title">Patient Management</h3>
                                    <ul class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Patient Management</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /Page Header -->
                        <c:if test="${requestScope.ERROR != null}">
                        <!--alert=============-->
                        <div class="toast"  data-autohide="true" data-delay="5000">
                            <div class="toast-header bg-danger-light">
                                <strong class="mr-auto text-danger-light">Checkout Section</strong>
                                <button type="button" class="text-danger ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                            </div>
                            <div class="toast-body">
                                <p class="text-danger">${requestScope.ERROR}</p>
                            </div>
                        </div>
                        <!--alert=============-->
                    </c:if>

                    <c:if test="${requestScope.SUCCESS != null}">
                        <!--alert=============-->
                        <div class="toast"  data-autohide="true" data-delay="3000">
                            <div class="toast-header bg-success-light">
                                <strong class="mr-auto text-success-light">Checkout Section</strong>
                                <button type="button" class="text-success ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                            </div>
                            <div class="toast-body">
                                <p class="text-success">${requestScope.SUCCESS}</p>
                            </div>
                        </div>
                        <!--alert=============-->
                    </c:if>

                    <%

                        String search = (String) request.getAttribute("SEARCH");
                        if (search == null) {
                            search = "";
                        }
                    %>
                    <div class="row">

                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">

                                    <form action="../admin/AdminSearchCustomerController" method="post"
                                          style="margin-bottom: 20px; margin-right: 20px;"
                                          data-toggle="modal">
                                        <input type="text" name="search" value="<%= search%>"/>
                                        <input type="submit" name="Search" value="Search" style="background-color: lightgreen; color: white; font-weight: bold"/>
                                    </form>
                                    <div class="table-responsive">

                                        <table class="datatable table table-hover table-center mb-0">

                                            <thead>

                                                <tr>

                                                    <th>ID</th>
                                                    <th>Patient Name</th>
                                                    <th>Gender</th>
                                                    <th>Age</th>
                                                    <th>Phone</th>
                                                    <th>Email</th>
                                                    <th class="text-center">Status</th>
                                                    <th class="text-right">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<Customer> customerList = (List<Customer>) request.getAttribute("LIST_CUSTOMER");
                                                    if (customerList != null) {
                                                        for (Customer customer : customerList) {
                                                %>
                                                <tr>
                                                    <td><a><%= customer.getId()%></td>
                                                    <td>
                                                        <h2 class="table-avatar">
                                                            <a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= request.getContextPath()%>/customer/<%= customer.getImage()%>" alt="Dentist Image"></a>
                                                            <a><%= customer.getPersonalName()%> </a>
                                                        </h2>
                                                    </td>
                                                    <td>
                                                        <% if (customer.getGender() == 0) { %>
                                                        Male
                                                        <% } else {%>
                                                        Female
                                                        <% }%>
                                                    </td>
                                                    <td><%= customer.getAge()%></td>
                                                    <td> <%= customer.getPhoneNumber()%></td>
                                                    <td><%= customer.getEmail()%></td>
                                                    <td class="text-center">
                                                        <% if (customer.getStatus() == 1) { %>
                                                        <%  if (customer.getBlacklistStatus() == 0) {  %>
                                                        <span class="badge badge-pill bg-success inv-badge">Active</span>
                                                        <%  } else { %>
                                                        <span class="badge badge-pill bg-warning inv-badge">Restricted</span>
                                                        <%  } %>
                                                        <% } else { %>
                                                        <span class="badge badge-pill bg-danger inv-badge">Inactive</span>
                                                        <% }%>
                                                    </td>
                                                    <td class="text-right">
                                                        <div class="actions">
                                                            <%
                                                                if (customer.getStatus() == 1) {
                                                            %>
                                                            <%
                                                                if (customer.getBlacklistStatus() == 0) {
                                                            %>
                                                            <a data-toggle="modal" data-target="#<%= customer.getId()%>" href="#edit_invoice_report" class="btn btn-sm bg-warning-light mr-2">
                                                                <i class="fe fe-pencil"></i> Restrict
                                                            </a>
                                                            <% } else {%>
                                                            <a data-toggle="modal" data-target="#unrestrict<%= customer.getId()%>" href="#edit_invoice_report" class="btn btn-sm bg-info-light mr-2">
                                                                <i class="fe fe-pencil"></i> Unrestrict
                                                            </a>
                                                            <% }%>
                                                            <a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal" onclick="deleteID('<%= customer.getId()%>')" >
                                                                <i class="fe fe-trash"></i> Delete
                                                            </a>
                                                            <% } else {%>
                                                            <a class="btn btn-sm bg-success-light" data-toggle="modal" href="#restore_modal" onclick="restoreID('<%= customer.getId()%>')" >
                                                                <i class="fe fe-trash"></i> Restore
                                                            </a>
                                                            <% }%>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>			
                    </div>

                </div>			
            </div>
            <!-- /Page Wrapper -->



            
        </div>
        <!-- /Main Wrapper -->
        
        <!-- Delete Modal -->
            <div class="modal fade" id="delete_modal" aria-hidden="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document" >
                    <div class="modal-content">
                        <!--	<div class="modal-header">
                                        <h5 class="modal-title">Delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                </div>-->
                        <div class="modal-body">
                            <div class="form-content p-2">
                                <h4 class="modal-title">Delete</h4>
                                <p class="mb-4">Are you sure want to delete this user?</p>
                                <form action="../admin/AdminDeleteCustomerController" method="POST">
                                    <input type="hidden" name="search" value="<%= search%>" />
                                    <input type="hidden" name="customerID" id="customer_id_delete"/>
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Restore Modal -->

            <div class="modal fade" id="restore_modal" aria-hidden="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document" >
                    <div class="modal-content">
                        <!--	<div class="modal-header">
                                        <h5 class="modal-title">Delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                        </button>
                                </div>-->
                        <div class="modal-body">
                            <div class="form-content p-2">
                                <h4 style="text-align: center" class="modal-title">Restore</h4>
                                <p style="text-align: center" class="mb-4">Are you sure want to restore this user?</p>
                                <form style="text-align: center" action="../admin/AdminRestoreCustomerController" method="POST">
                                    <input type="hidden" name="search" value="<%= search%>" />
                                    <input type="hidden" name="customerID" id="customer_id_restore"/>
                                    <button type="submit" class="btn btn-danger">Restore</button>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Restore Modal -->


            <!-- Confirm restrict Modal -->
            <c:forEach var="list" items="${LIST_CUSTOMER}">
                <div class="modal fade" id="${list.id}" aria-hidden="true" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document" >
                        <div class="modal-content text-center">
                            <div class="modal-body">
                                <div class="form-content p-2">
                                    <h4 class="modal-title">Restrict User</h4>
                                    <p class="mb-4">${list.id} - ${list.personalName}</p>
                                    <p class="mb-4">Are you sure want to restrict this user?</p>
                                    <a href="<%=request.getContextPath()%>/admin/SetBlacklistController?customerID=${list.id}&search=<%= search%>" class="btn btn-warning">Restrict</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:forEach var="list" items="${LIST_CUSTOMER}">
                <div class="modal fade" id="unrestrict${list.id}" aria-hidden="true" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document" >
                        <div class="modal-content text-center">

                            <div class="modal-body">
                                <div class="form-content p-2">
                                    <h4 class="modal-title">Unrestrict User</h4>
                                    <p class="mb-4">${list.id} - ${list.personalName}</p>
                                    <p class="mb-4">Are you sure want to unrestrict this user?</p>
                                    <a href="<%=request.getContextPath()%>/admin/UnSetBlacklistController?customerID=${list.id}&search=<%= search%>" class="btn btn-warning">Unrestrict</a>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- /Confirm restrict Modal -->

        <!-- jQuery -->
        <script src="assets/js/jquery-3.2.1.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Slimscroll JS -->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Datatables JS -->
        <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatables/datatables.min.js"></script>

        <!-- Custom JS -->
        <script  src="assets/js/script.js"></script>
        <script>
                                                                var deleteID = function (id) {
                                                                    var deleteid = document.getElementById('customer_id_delete');
                                                                    deleteid.value = id.toString();
                                                                };
        </script>
        <script>
            var restoreID = function (id) {
                var restoreid = document.getElementById('customer_id_restore');
                restoreid.value = id.toString();
            };
        </script>
        <script>
                                        $(document).ready(function () {
                                            $('.toast').toast('show');
                                        });
                                    </script>
    </body>

    <!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
</html>