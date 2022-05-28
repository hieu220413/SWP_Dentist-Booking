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

                            
                                            String successMessage = (String) request.getAttribute("SUCCESS");
                                            if(successMessage == null){
                                                successMessage = "";
                                            }

                                        %>
                                        <%= error.getUsernameError() %><% if (!error.getUsernameError().equals("")) %><br><%;%>
                                        <%= error.getPasswordError() %><% if (!error.getPasswordError().equals("")) %><br><%;%>
                                        <%= error.getPersonalNameError()%><% if (!error.getPersonalNameError().equals("")) %><br><%;%>
                                        <%= error.getDescriptionError() %><% if (!error.getDescriptionError().equals("")) %><br><%;%>
                                        <%= error.getEducationError() %><% if (!error.getEducationError().equals("")) %><br><%;%>
                                        <%= error.getAwardError() %><% if (!error.getAwardError().equals("")) %><br><%;%>
                                        <%= successMessage %><% if (!successMessage.equals("")) %><br><%;%>
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
															<a data-toggle="modal" href="#<%= dentist.getId() %>" class="btn btn-sm bg-warning-light mr-2">
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
                        <% 
                         
                            if(dentistList!=null){
                                for( Dentist dentist : dentistList ){
                         %>
			<div class="modal fade" id="<%= dentist.getId() %>" aria-hidden="true" role="dialog">
				<div class="modal-dialog modal-dialog-centered" role="document" >
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Edit Dentist</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="../admin/AdminUpdateDentistController" method="POST">
								<div class="row form-row">
                                                                        <input type="hidden" name="id" value="<%= dentist.getId() %>"/>

									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Personal Name</label>
                                                                                        <input type="text" class="form-control" name="personalName" value="<%= dentist.getPersonalName()%>" minlength="5" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Gender</label>
                                                                                        <select class="form-control" name="gender" ><br>
                                                                                            <option value="0"<% if (dentist.getGender()== 0){ %> selected <% } %> >Male</option>
                                                                                            <option value="1"<% if (dentist.getGender()== 1){ %> selected <% } %> >Female</option>
                                                                                        </select>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Speciality</label>
                                                                                        <select class="form-control" name="speciality" >
                                                                                            <option value="Pedodontist"<% if (dentist.getSpeciality().equals("Pedodontist")){ %> selected <% } %>>Pedodontist</option>
                                                                                            <option value="Orthodontist"<% if (dentist.getSpeciality().equals("Orthodontist")){ %> selected <% } %>>Orthodontist</option>
                                                                                            <option value="Periodontist"<% if (dentist.getSpeciality().equals("Periodontist")){ %> selected <% } %>>Periodontist</option>
                                                                                            <option value="Endodontist"<% if (dentist.getSpeciality().equals("Endodontist")){ %> selected <% } %>>Endodontist</option>
                                                                                            <option value="Prosthodontist"<% if (dentist.getSpeciality().equals("Prosthodontist")){ %> selected <% } %>>Prosthodontist</option>
                                                                                        </select>
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Description</label>
                                                                                        <textarea class="form-control" name="description" rows="3" minlength="10" maxlength="500" ><%= dentist.getDescription() %></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Education</label>
                                                                                        <textarea class="form-control" name="education" rows="3" minlength="10" maxlength="300"><%= dentist.getEducation()%></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Working Experience</label>
                                                                                        <input type="number" class="form-control" name="workingExperience" value="<%= dentist.getWorkingExperience() %>" step="1" min="2" required="" /> 
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Award</label>
                                                                                        <textarea class="form-control" name="award" rows="3"  minlength="5" maxlength="300"><%= dentist.getAward()%></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Image</label>
                                                                                        <input type="file" class="form-control" name="image" accept="image/*" required="" />
										</div>
									</div>
									
								</div>
								<button type="submit" name="updateDentist" class="btn btn-primary btn-block">Save Changes</button>
							</form>
						</div>
					</div>
				</div>
			</div>
                        <%      } 
                            }
                        %>
			<!-- /Edit Details Modal -->
			<!-- Add Dentist Modal -->

                        

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
                                                                                        <input type="text" class="form-control" name="username" minlength="5" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Password</label>
                                                                                        <input type="password" class="form-control" name="password"  minlength="8" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Personal Name</label>
                                                                                        <input type="text" class="form-control" name="personalName"  minlength="5" maxlength="30">
										</div>
									</div>
									<div class="col-12 col-sm-6">
										<div class="form-group">
											<label>Gender</label>
                                                                                        <select class="form-control" name="gender"><br>
                                                                                            <option value="1">Female</option>
                                                                                            <option value="0">Male</option>
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
                                                                                        <textarea class="form-control" name="description" rows="3"  minlength="10" maxlength="500"></textarea>
										</div>
									</div>
                                                                        <div class="col-12 col-sm-12">
										<div class="form-group">
											<label>Education</label>
                                                                                        <textarea class="form-control" name="education" rows="3"  minlength="10" maxlength="300"></textarea>
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
                                                                                        <textarea class="form-control" name="award" rows="3"  minlength="5" maxlength="300"></textarea>
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