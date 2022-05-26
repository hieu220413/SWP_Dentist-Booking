<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Dental Clinic</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!-- Fontawesome CSS -->
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <!-- Select2 CSS -->
        <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

        <!-- Main CSS -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
                <script src="assets/js/html5shiv.min.js"></script>
                <script src="assets/js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!--Header-->
            <jsp:include flush="true" page="header.jsp"></jsp:include>
                <!--/Header-->

                <!-- Breadcrumb -->
                <div class="breadcrumb-bar">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-md-12 col-12">
                                <nav aria-label="breadcrumb" class="page-breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">Schedule Timings</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Schedule Timings</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Page Content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">

                                <!-- Profile Side Bar -->
                            <jsp:include flush="true" page="profile-sidebar.jsp"></jsp:include>
                            <!-- /Profile Side Bar -->

                        </div>

                        <div class="col-md-7 col-lg-8 col-xl-9">

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Update available slot</h4>
                                            <div class="profile-box">
                                                <div class="row">

                                                    <div class="col-lg-4">
                                                        <div>               
                                                            Time Slot Duration:
                                                            <h5>90 minutes</h5>
                                                        </div>
                                                    </div>

                                                </div>     
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="card schedule-widget mb-0">

                                                            <!-- Schedule Header -->
                                                            <div class="schedule-header">

                                                                <!-- Schedule Nav -->
                                                                <div class="schedule-nav">
                                                                    <ul class="nav nav-tabs nav-justified">
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_sunday">Sunday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link active" data-toggle="tab" href="#slot_monday">Monday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_tuesday">Tuesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_wednesday">Wednesday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_thursday">Thursday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_friday">Friday</a>
                                                                        </li>
                                                                        <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="tab" href="#slot_saturday">Saturday</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <!-- /Schedule Nav -->

                                                            </div>
                                                            <!-- /Schedule Header -->

                                                            <!-- Schedule Content -->
                                                            <div class="tab-content schedule-cont">

                                                                <!-- Sunday Slot -->
                                                                <div id="slot_sunday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Sunday Slot -->

                                                                <!-- Monday Slot -->
                                                                <div id="slot_monday" class="tab-pane fade show active">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#edit_time_slot"><i class="fa fa-edit mr-1"></i>Edit</a>
                                                                    </h4>

                                                                    <!-- Slot List -->
                                                                    <div class="doc-times">
                                                                        <div class="doc-slot-list">
                                                                            7:00 pm - 8:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="doc-slot-list">
                                                                            8:45 pm - 10:15 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="doc-slot-list">
                                                                            10:30 pm - 12:00 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="doc-slot-list">
                                                                            13:00 pm - 14:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="doc-slot-list">
                                                                            15:00 pm - 16:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div class="doc-slot-list">
                                                                            17:00 pm - 18:30 pm
                                                                            <a href="javascript:void(0)" class="delete_schedule">
                                                                                <i class="fa fa-times"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <!-- /Slot List -->

                                                                </div>
                                                                <!-- /Monday Slot -->

                                                                <!-- Tuesday Slot -->
                                                                <div id="slot_tuesday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Tuesday Slot -->

                                                                <!-- Wednesday Slot -->
                                                                <div id="slot_wednesday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Wednesday Slot -->

                                                                <!-- Thursday Slot -->
                                                                <div id="slot_thursday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Thursday Slot -->

                                                                <!-- Friday Slot -->
                                                                <div id="slot_friday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Friday Slot -->

                                                                <!-- Saturday Slot -->
                                                                <div id="slot_saturday" class="tab-pane fade">
                                                                    <h4 class="card-title d-flex justify-content-between">
                                                                        <span>Time Slots</span> 
                                                                        <a class="edit-link" data-toggle="modal" href="#add_time_slot"><i class="fa fa-plus-circle"></i> Add Slot</a>
                                                                    </h4>
                                                                    <p class="text-muted mb-0">Not Available</p>
                                                                </div>
                                                                <!-- /Saturday Slot -->

                                                            </div>
                                                            <!-- /Schedule Content -->

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>		
            <!-- /Page Content -->

            <!-- Footer -->
            <jsp:include flush="true" page="footer.jsp"></jsp:include> 
            <!-- /Footer -->

        </div>
        <!-- /Main Wrapper -->

        <!-- Add Time Slot Modal -->
        <div class="modal fade custom-modal" id="add_time_slot">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option>12.30 am</option>  
                                                        <option>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div> 
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option>12.30 am</option>  
                                                        <option>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="add-more mb-3">
                                <a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add Time Slot Modal -->

        <!-- Edit Time Slot Modal -->
        <div class="modal fade custom-modal" id="edit_time_slot">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Time Slots</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="hours-info">
                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option selected>12.00 am</option>
                                                        <option>12.30 am</option>  
                                                        <option>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div> 
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option selected>12.30 am</option>  
                                                        <option>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option selected>12.30 am</option>
                                                        <option>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option>12.30 am</option>
                                                        <option selected>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
                                </div>

                                <div class="row form-row hours-cont">
                                    <div class="col-12 col-md-10">
                                        <div class="row form-row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>Start Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option>12.30 am</option>
                                                        <option selected>1.00 am</option>
                                                        <option>1.30 am</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label>End Time</label>
                                                    <select class="form-control">
                                                        <option>-</option>
                                                        <option>12.00 am</option>
                                                        <option>12.30 am</option>
                                                        <option>1.00 am</option>
                                                        <option selected>1.30 am</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-2"><label class="d-md-block d-sm-none d-none">&nbsp;</label><a href="#" class="btn btn-danger trash"><i class="far fa-trash-alt"></i></a></div>
                                </div>

                            </div>

                            <div class="add-more mb-3">
                                <a href="javascript:void(0);" class="add-hours"><i class="fa fa-plus-circle"></i> Add More</a>
                            </div>
                            <div class="submit-section text-center">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Edit Time Slot Modal -->

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Select2 JS -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/schedule-timings.html  30 Nov 2019 04:12:09 GMT -->
</html>