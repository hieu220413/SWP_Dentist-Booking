<%-- 
    Document   : dentist-feedback
    Created on : May 21, 2022, 12:18:49 PM
    Author     : hieunguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
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
                                        <li class="breadcrumb-item active" aria-current="page">Reviews</li>
                                    </ol>
                                </nav>
                                <h2 class="breadcrumb-title">Reviews</h2>
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
                            <div class="doc-review review-listing">

                                <!-- Review Listing -->
                                <ul class="comments-list">

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Richard Wilson</span>
                                                    <span class="comment-date">Reviewed 2 Days ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star"></i>
                                                    </div>
                                                </div>
                                                <p class="recommended"><i class="far fa-thumbs-up"></i> I recommend the doctor</p>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Comment Reply -->
                                        <ul class="comments-reply">

                                            <!-- Comment Reply List -->
                                            <li>
                                                <div class="comment">
                                                    <img class="avatar rounded-circle" alt="User Image" src="assets/img/doctors/doctor-thumb-02.jpg">
                                                    <div class="comment-body">
                                                        <div class="meta-data">
                                                            <span class="comment-author">Dr. Darren Elder</span>
                                                            <span class="comment-date">Reviewed 3 Days ago</span>
                                                        </div>
                                                        <p class="comment-content">
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                            Ut enim ad minim veniam.
                                                            Curabitur non nulla sit amet nisl tempus
                                                        </p>
                                                        <div class="comment-reply">
                                                            <a class="comment-btn" href="#">
                                                                <i class="fas fa-reply"></i> Reply
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <!-- /Comment Reply List -->

                                        </ul>
                                        <!-- /Comment Reply -->

                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient2.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Travis Trimble</span>
                                                    <span class="comment-date">Reviewed 4 Days ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient3.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Carl Kelly</span>
                                                    <span class="comment-date">Reviewed 5 Days ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient4.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Michelle Fairfax</span>
                                                    <span class="comment-date">Reviewed 6 Days ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient5.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Gina Moore</span>
                                                    <span class="comment-date">Reviewed 1 Week ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient9.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Walter Roberson</span>
                                                    <span class="comment-date">Reviewed 1 Week ago</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                    <!-- Comment List -->
                                    <li>
                                        <div class="comment">
                                            <img class="avatar rounded-circle" alt="User Image" src="assets/img/patients/patient8.jpg">
                                            <div class="comment-body">
                                                <div class="meta-data">
                                                    <span class="comment-author">Daniel Griffing</span>
                                                    <span class="comment-date">Reviewed on 1 Nov 2019</span>
                                                    <div class="review-count rating">
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                        <i class="fas fa-star filled"></i>
                                                    </div>
                                                </div>
                                                <p class="comment-content">
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                                    Ut enim ad minim veniam, quis nostrud exercitation.
                                                    Curabitur non nulla sit amet nisl tempus
                                                </p>
                                                <div class="comment-reply">
                                                    <a class="comment-btn" href="#">
                                                        <i class="fas fa-reply"></i> Reply
                                                    </a>
                                                    <p class="recommend-btn">
                                                        <span>Recommend?</span>
                                                        <a href="#" class="like-btn">
                                                            <i class="far fa-thumbs-up"></i> Yes
                                                        </a>
                                                        <a href="#" class="dislike-btn">
                                                            <i class="far fa-thumbs-down"></i> No
                                                        </a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- /Comment List -->

                                </ul>
                                <!-- /Comment List -->

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

        <!-- jQuery -->
        <script src="assets/js/jquery.min.js"></script>

        <!-- Bootstrap Core JS -->
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Sticky Sidebar JS -->
        <script src="assets/plugins/theia-sticky-sidebar/ResizeSensor.js"></script>
        <script src="assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.js"></script>

        <!-- Custom JS -->
        <script src="assets/js/script.js"></script>

    </body>

    <!-- doccure/reviews.html  30 Nov 2019 04:12:15 GMT -->
</html>
