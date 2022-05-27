<%@page import="java.util.List"%>
<%@page import="com.fptproject.SWP391.model.Dentist"%>
<%@page import="com.fptproject.SWP391.error.DentistError"%>
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
								<h3 class="page-title">Dentist Management</h3>
								<ul class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
									<li class="breadcrumb-item active">Dentist Management</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- /Page Header -->
					<%
                                            DentistError error = (DentistError) request.getAttribute("DENTIST_ERROR");
                                            if(error == null){
                                                error = new DentistError();
                                            }
                                        %>
                                        <%= error.getUsernameError() %><% if (!error.getUsernameError().equals("")) %><br><%;%>
                                        <%= error.getPasswordError() %><% if (!error.getPasswordError().equals("")) %><br><%;%>
                                        <%= error.getDescriptionError() %><% if (!error.getDescriptionError().equals("")) %><br><%;%>
                                        <%= error.getEducationError() %><% if (!error.getEducationError().equals("")) %><br><%;%>
                                        <%= error.getAwardError() %><% if (!error.getAwardError().equals("")) %><br><%;%>
					<div class="row">

						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<a class="btn btn-sm bg-success-light pull-right"
											style="margin-bottom: 20px;"
											data-toggle="modal" href="#add_dentist">
												<i class="fe fe-plus"></i> Add new Dentist
									</a>
                                                                        <form action="../admin/AdminSearchDentistController" method="post"
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
													<th>Dentist Name</th>
                                                                                                        <th>Speciality</th>
                                                                                                        <th>Gender</th>
													<th>Rate</th>
													<th class="text-center">Status</th>
													<th class="text-right">Actions</th>
												</tr>
											</thead>
											<tbody>
                                                                                                <% 
                                                                                                    List<Dentist> dentistList = (List<Dentist>) request.getAttribute("LIST_DENTIST");
                                                                                                    if(dentistList!=null){
                                                                                                        for( Dentist dentist : dentistList ){
                                                                                                %>
												<tr>
													<td><a><%= dentist.getId() %></td>
													<td>
                                                                                                                <h2 class="table-avatar">
															<a class="avatar avatar-sm mr-2"><img class="avatar-img rounded-circle" src="<%= dentist.getImage()%>" alt="Dentist Image"></a>
															<a><%= dentist.getPersonalName() %> </a>
                                                                                                                </h2>
                                                                                                        </td>
													<td><%= dentist.getSpeciality() %></td>
                                                                                                        <td>
                                                                                                            <% if(dentist.getGender()== 0){ %>
                                                                                                                Male
                                                                                                            <% }else{%>
                                                                                                                Female
                                                                                                            <% }%>
                                                                                                        </td>
                                                                                                        <td><span style="font-size:110%;color:#f3e201;">&starf;</span> <%= dentist.getRate() %></td>
													<td class="text-center">
                                                                                                            <% if( dentist.getStatus() == 1){ %>
														<span class="badge badge-pill bg-success inv-badge">Available</span>
                                                                                                            <% }else{  %>
                                                                                                                <span class="badge badge-pill bg-danger inv-badge">Unavailable</span>
                                                                                                            <% } %>
													</td>
													<td class="text-right">
														<div class="actions">
                                                                                                                    <%
                                                                                                                        if(dentist.getStatus()== 1){
                                                                                                                    %>
															<a data-toggle="modal" href="#edit_invoice_report" class="btn btn-sm bg-warning-light mr-2">
																<i class="fe fe-pencil"></i> Edit
															</a>
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
			
			<!-- Edit Details Modal -->
			<div class="modal fade" id="edit_invoice_report" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Dentist</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Dentist's Name</label>
											<input type="text" class="form-control" value="#INV-0001">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Dentist's ID Name</label>
											<input type="text" class="form-control" value="	#PT002">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Password</label>
											<input type="text" class="form-control" value="R Amer">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Patient Image</label>
											<input type="file"  class="form-control">
										</div>
									</div>
									
									<div class="col-12 col-sm-6">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
											<label class="form-check-label" for="flexCheckDefault">
											  Slot 1
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 2
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 4
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 5
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 6
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 7
											</label>
										  </div>
										  <div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
											<label class="form-check-label" for="flexCheckChecked">
											  Slot 8
											</label>
										  </div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="dropdown">
											<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											  Status
											</button>
											<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											  <a class="dropdown-item" href="#">Activate</a>
											  <a class="dropdown-item" href="#">Deactivate</a>
											</div>
										  </div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /Edit Details Modal -->
			<!-- Add Dentist Modal -->
                        <%
                            
                            String successMessage = (String) request.getAttribute("SUCCESS");
                            if(successMessage == null){
                                successMessage = "";
                            }

                        %>
                        

                       <div class="modal fade" id="add_dentist" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Add new dentist</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="../admin/AdminCreateDentistController" method="POST">
								<div class="row form-row">
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Username</label>
											<input type="text" class="form-control" name="username">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Password</label>
                                                                                        <input type="password" class="form-control" name="password">
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Personal Name</label>
                                                                                        <input type="text" class="form-control" name="personalName">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Gender</label>
                                                                                        <select class="form-control" name="gender"><br>
                                                                                            <option value="0">Female</option>
                                                                                            <option value="1">Male</option>
                                                                                        </select>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Speciality</label>
                                                                                        <select class="form-control" name="speciality" >
                                                                                            <option value="Pedodontist">Pedodontist</option>
                                                                                            <option value="Orthodontist">Orthodontist</option>
                                                                                            <option value="Periodontist">Periodontist</option>
                                                                                            <option value="Endodontist">Endodontist</option>
                                                                                            <option value="Prosthodontist">Prosthodontist</option>
                                                                                        </select>
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Description</label>
                                                                                        <textarea class="form-control" name="description" rows="3"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Education</label>
                                                                                        <textarea class="form-control" name="education" rows="3"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Working Experience (years): </label>
                                                                                        <input type="number" class="form-control" name="workingExperience" step="1" min="2" required="" /> 
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Award</label>
                                                                                        <textarea class="form-control" name="award" rows="3"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Image</label>
                                                                                        <input type="file" class="form-control" name="image" accept="image/*" required=""/>
										</div>
									</div>
									
								</div>
								<button type="submit" name="createDentist" class="btn btn-primary btn-block">Add new</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /Edit Details Modal -->
		
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