<%@page import="com.fptproject.SWP391.model.Customer"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    
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

					<div class="row">

						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
						
                                                                        <form action="../admin/AdminSearchCustomerController" method="post"
											style="margin-bottom: 20px; margin-right: 20px;"
											data-toggle="modal">
                                                                                <input type="text" name="search" />
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
                                                                                                    if(customerList!=null){
                                                                                                        for( Customer customer : customerList ){
                                                                                                %>
												<tr>
													<td><a><%= customer.getId() %></td>
													<td>
                                                                                                                <h2 class="table-avatar">
															<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= customer.getImage()%>" alt="Dentist Image"></a>
															<a><%= customer.getPersonalName() %> </a>
                                                                                                                </h2>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <% if(customer.getGender()== 0){ %>
                                                                                                                Male
                                                                                                            <% }else{%>
                                                                                                                Female
                                                                                                            <% }%>
                                                                                                        </td>
                                                                                                        <td><%= customer.getAge() %></td>
                                                                                                        <td> <%= customer.getPhoneNumber()%></td>
                                                                                                        <td><%= customer.getEmail() %></td>
													<td class="text-center">
                                                                                                            <% if( customer.getStatus() == 1){ %>
                                                                                                            <%  if( customer.getBlacklistStatus()== 0 ){  %>
														<span class="badge badge-pill bg-success inv-badge">Active</span>
                                                                                                            <%  }else{ %>
                                                                                                                <span class="badge badge-pill bg-danger inv-badge">Restricted</span>
                                                                                                            <%  } %>
                                                                                                            <% }else{ %>
                                                                                                                <span class="badge badge-pill bg-danger inv-badge">Inactive</span>
                                                                                                            <% }%>
													</td>
													<td class="text-right">
														<div class="actions">
                                                                                                                    <%
                                                                                                                        if(customer.getStatus()== 1){
                                                                                                                    %>
                                                                                                                            <%
                                                                                                                            if(customer.getBlacklistStatus()== 0){
                                                                                                                            %>
                                                                                                                                <a data-toggle="modal" href="#edit_invoice_report" class="btn btn-sm bg-warning-light mr-2">
                                                                                                                                        <i class="fe fe-pencil"></i> Restrict
                                                                                                                                </a>
                                                                                                                            <% }else{ %>
                                                                                                                                <a data-toggle="modal" href="#edit_invoice_report" class="btn btn-sm bg-warning-light mr-2">
                                                                                                                                        <i class="fe fe-pencil"></i> Free
                                                                                                                                </a>
                                                                                                                            <% }%>
                                                                                                                                <a class="btn btn-sm bg-danger-light" data-toggle="modal" href="#delete_modal">
                                                                                                                                        <i class="fe fe-trash"></i> Delete
                                                                                                                                </a>
                                                                                                                    <% } %>
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
								<p class="mb-4">Are you sure want to delete?</p>
								<button type="button" class="btn btn-primary">Save </button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Delete Modal -->
        </div>
		<!-- /Main Wrapper -->
		
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
		
    </body>

<!-- Mirrored from dreamguys.co.in/demo/doccure/admin/invoice-report.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 30 Nov 2019 04:12:53 GMT -->
</html>