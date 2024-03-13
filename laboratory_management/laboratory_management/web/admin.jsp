<%@ page import="dao.TestDAO" %>
<%@ page import="custom.ObjectFactory" %>
<%@ page import="model.Appointment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.AppointmentDAO" %>
<%@ page import="dao.QueryDAO" %>
<%@ page import="model.ApointmentTestResults" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>ABC Laboratory</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        #resultSubmissionModal .modal-content {
            background-color: white; /* White background color */
            border-radius: 15px; /* Rounded corners for the modal */
            padding: 20px; /* Padding inside the modal */
            box-shadow: 0 5px 15px rgba(0,0,0,0.3); /* Optional: adds a shadow to your modal for better focus */
        }

        #resultSubmissionModal .modal-header {
            border-bottom: 1px solid #eeeeee; /* Adds a subtle line to separate the header */
        }

        #resultSubmissionModal .modal-body {
            padding: 20px 40px; /* More padding inside the body for better spacing */
        }

        #resultSubmissionModal .form-group {
            margin-bottom: 1rem; /* Space between form groups */
        }

        #resultSubmissionModal .form-control {
            border-radius: 5px; /* Rounded borders for form inputs */
        }

        #resultSubmissionModal .btn-primary {
            background-color: #004085; /* Example primary color */
            border-color: #004085; /* Border color to match */
            box-shadow: none; /* Removes the default Bootstrap shadow on buttons */
        }

        #resultSubmissionModal .btn-primary:hover {
            background-color: #0056b3; /* Darker shade on hover for the button */
            border-color: #004085; /* Keep the border color consistent */
        }

    </style>

</head>

<body>
<%
    AppointmentDAO appointmentDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.APPOINTMENT);
    QueryDAO queryDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.QUERY);
    TestDAO testDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.TESTRESULTS);
    ArrayList<ApointmentTestResults> appointments = null;
    ArrayList<ApointmentTestResults> testResults = null;
    int imageId = testDAO.getNextAvailableId();
    try {
        appointments = queryDAO.getAllPendingAppointments();
        testResults = queryDAO.getAll();
    }catch (Exception e){
        e.printStackTrace();
    }
%>


<!-- ======= Top Bar ======= -->
<div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex align-items-center justify-content-center justify-content-md-between">
        <div class="align-items-center d-none d-md-flex">
            <i class="bi bi-clock"></i> Monday - Saturday, 8AM to 10PM
        </div>
        <div class="d-flex align-items-center">
            <i class="bi bi-phone"></i> Call us now +94 716253045
        </div>
    </div>
</div>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

        <a href="index.jsp" class="logo me-auto logo_width"><img src="assets/img/logo1.png" alt="" style="width: 250px!important;"></a>

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto " href="index.jsp">Home</a></li>
                <li><a class="nav-link scrollto" href="#about">About</a></li>
                <li><a class="nav-link scrollto" href="#services">Services</a></li>
                <li><a class="nav-link scrollto" href="#doctors">Doctors</a></li>
                <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

        <%
            if (session.getAttribute("username") != null){
        %>
        <a href="/login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline"></span> Log Out</a>
        <%}else {%>
        <a href="/login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline"></span> Login</a>
        <%}%>

    </div>
</header><!-- End Header -->


<main id="main">

    <%if (session.getAttribute("username") != null){%>
    <!-- ======= Appointment Section ======= -->
    <section id="appointment" class="appointment section-bg">
        <div class="container" data-aos="fade-up">
<br><br><br><br><br>
            <div class="section-title">
                <h4>Pending Appointments</h4>
            </div>

            <div class="row">
                <div class="container mt-3">
                    <input type="text" id="searchInput1" onkeyup="filterTable('searchInput1', 'appointmentsTable1')" placeholder="Search for appointments..." class="form-control mb-3">
                    <table class="table table-striped" id="appointmentsTable1">
                        <thead>
                        <tr>
                            <th>Appointment Number</th>
                            <th>Appointment Date</th>
                            <th>Test Type</th>
                            <th>Doctor</th>
                            <th>Appointment Fee</th>
                            <th>Action</th>
                            <th hidden>username</th>
                            <th hidden>name</th>
                            <th hidden>contact</th>
                            <th hidden>email</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(ApointmentTestResults appointment:appointments) {
                        %>
                        <tr>
                            <td><%=appointment.getAppointmentNumber()%></td>
                            <td><%=appointment.getAppointmentDate()%></td>
                            <td><%=appointment.getServiceType()%></td>
                            <td><%=appointment.getDoctor()%></td>
                            <td><%=appointment.getAppointmentFee()%></td>
                            <td>
                                <%
                                if (appointment.getAppointmentTime().trim().equals("")){
                                %>
                                <button class="btn btn-primary" style="margin-top: 10px;background-color: #65c9cd;font-size: 13px" onclick="openMailModal(this)" id="<%=String.valueOf(appointment.getAppointmentNumber()) + "_mail"%>">Send Mail</button>
                                <%
                                    }
                                %>
                                <button class="btn btn-primary" style="margin-top: 10px;background-color: #65c9cd;font-size: 13px" onclick="openResultModal(this)" data-appointment-number="<%=appointment.getAppointmentNumber()%>">Submit Result</button></td>
                            <td hidden><%=appointment.getUsername()%></td>
                            <td hidden><%=appointment.getPatientName()%></td>
                            <td hidden><%=appointment.getPatientContact()%></td>
                            <td hidden><%=appointment.getPatientEmail()%></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>

            </div>
<br><br><br>
            <div class="section-title">
                <h4>Test Results</h4>
            </div>

            <div class="row">
                <div class="container mt-3">
                    <input type="text" id="searchInput2" onkeyup="filterTable('searchInput2', 'appointmentsTable2')" placeholder="Search for Results..." class="form-control mb-3">
                    <table class="table table-striped" id="appointmentsTable2">
                        <thead>
                        <tr>
                            <th>Appointment Number</th>
                            <th>Appointment Date</th>
                            <th>Test Type</th>
                            <th>Doctor</th>
                            <th>Technician</th>
                            <th>Test Fee</th>
                            <th>Result Date</th>
                            <th>Result</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for(ApointmentTestResults results:testResults) {
                        %>
                        <tr>
                            <td><%=results.getAppointmentNumber()%></td>
                            <td><%=results.getAppointmentDate()%></td>
                            <td><%=results.getServiceType()%></td>
                            <td><%=results.getDoctor()%></td>
                            <td><%=results.getTechnician()%></td>
                            <td><%=results.getTestFee()%></td>
                            <td><%=results.getResultDate()%></td>
                            <td><button class="btn btn-primary" style="background-color: #65c9cd; font-size: 13px" onclick="downloadPDF(this)" id="<%=results.getTestResultId()%>">View & Download</button></td>

                        </tr>
                        <%}%>
                        <!-- More rows as needed -->
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </section><!-- End Appointment Section -->

    <!-- Result Submission Modal -->
    <div class="modal fade" id="resultSubmissionModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">Submit Result</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--<form id="resultForm" class="container-fluid" method="post" enctype="multipart/form-data">--%>
                    <div id="resultForm" class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalAppointmentNumber">Appointment Number</label>
                                <input type="text" class="form-control" id="modalAppointmentNumber" readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalAppointmentDate">Appointment Date</label>
                                <input type="text" class="form-control" id="modalAppointmentDate" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalTestType">Test Type</label>
                                <input type="text" class="form-control" id="modalTestType" readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalDoctor">Doctor</label>
                                <input type="text" class="form-control" id="modalDoctor" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalAppointmentFee">Appointment Fee</label>
                                <input type="text" class="form-control" id="modalAppointmentFee" readonly>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalPatientName">Patient Name</label>
                                <input type="text" class="form-control" id="modalPatientName">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalPatientContact">Patient Contact</label>
                                <input type="text" class="form-control" id="modalPatientContact" readonly>
                                <input type="text" class="form-control" id="modalPatientUsername" readonly hidden>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalPatientEmail">Patient Email</label>
                                <input type="text" class="form-control" id="modalPatientEmail" readonly>
                                <input type="text" class="form-control" id="action" value="save" hidden>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalResultDate">Result Date</label>
                                <input type="text" class="form-control datepicker" id="modalResultDate">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalTechnician">Technician</label>
                                <select class="form-control" id="modalTechnician">
                                    <option value="">Select Technician</option>
                                    <!-- Dynamically populate these options based on your application logic -->
                                    <option value="technician1">Technician 1</option>
                                    <option value="technician2">Technician 2</option>
                                    <option value="technician3">Technician 3</option>
                                    <option value="technician4">Technician 4</option>
                                    <option value="technician5">Technician 5</option>
                                    <!-- Add more options here -->
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="modalTestFee">Test Fee</label>
                                <input type="test" class="form-control" id="modalTestFee">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="modalPdfUpload">Upload PDF</label>
                                <input type="file" class="form-control-file" id="modalPdfUpload" accept="application/pdf">
                            </div>
                        </div>
                        <!-- More rows and columns as needed -->
                        <button type="button" onclick="saveResults()" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="mailModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="" class="container-fluid">
                        <!-- Single column layout -->
                        <div class="form-group">
                            <label for="appointmentTime">Enter Appointment Time :</label>
                            <input type="text" class="form-control" id="appointmentTime" required>
                            <input type="text" class="form-control" id="appointmentno" hidden>
                            <input type="text" class="form-control" id="appointmentdte" hidden>
                            <input type="text" class="form-control" id="testtype" hidden>
                            <input type="text" class="form-control" id="doc" hidden>
                            <input type="text" class="form-control" id="fee" hidden>
                            <input type="text" class="form-control" id="pname" hidden>
                            <input type="text" class="form-control" id="email" hidden>
                        </div>
                        <!-- Submit Button -->
                        <button type="button" onclick="setTimeAndSendMail()" class="btn btn-primary" style="color: #be2d09">Send Mail</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%}%>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>ABC Laboratory</span></strong>. All Rights Reserved
        </div>
    </div>
</footer><!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>
<script>

    $(document).ready(function(){

        $("#modalResultDate").datepicker({
            dateFormat: "yy-mm-dd" // This is optional, adjust the format as you need
        });
    });


    function filterTable(inputId, tableId) {
        var input, filter, table, tr, td, txtValue, found;
        input = document.getElementById(inputId);
        filter = input.value.toUpperCase();
        table = document.getElementById(tableId);
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows
        for (var i = 1; i < tr.length; i++) { // Start at 1 to skip the header row
            td = tr[i].getElementsByTagName("td");
            found = false; // Initialize a flag to track if the row should be displayed

            // Loop through all cells in the current row
            for (var j = 0; j < td.length; j++) {
                if (td[j]) {
                    txtValue = td[j].textContent || td[j].innerText;
                    // Check if the cell contains the search string
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        found = true; // Set the flag if the cell matches the search string
                        break; // No need to check the rest of the cells in the current row
                    }
                }
            }

            // Show or hide the row based on the search result
            tr[i].style.display = found ? "" : "none";
        }
    }

    function openResultModal(button) {

        // Get the row to which the clicked button belongs
        var row = button.closest('tr');

        // Extract values from the row's cells
        var appointmentNumber = row.cells[0].textContent;
        var appointmentDate = row.cells[1].textContent;
        var testType = row.cells[2].textContent;
        var doctor = row.cells[3].textContent;
        var appointmentFee = row.cells[4].textContent;
        var modalPatientUsername = row.cells[6].textContent;
        var modalPatientName = row.cells[7].textContent;
        var modalPatientContact = row.cells[8].textContent;
        var modalPatientEmail = row.cells[9].textContent;

        // Populate the modal fields with these values
        document.getElementById('modalAppointmentNumber').value = appointmentNumber.trim();
        document.getElementById('modalAppointmentDate').value = appointmentDate.trim();
        document.getElementById('modalTestType').value = testType.trim();
        document.getElementById('modalDoctor').value = doctor.trim();
        document.getElementById('modalAppointmentFee').value = appointmentFee.trim();
        document.getElementById('modalPatientName').value = modalPatientName.trim();
        document.getElementById('modalPatientContact').value = modalPatientContact.trim();
        document.getElementById('modalPatientEmail').value = modalPatientEmail.trim();
        document.getElementById('modalPatientUsername').value = modalPatientUsername.trim();

        // Finally, show the modal
        $('#resultSubmissionModal').modal('show');
    }

    function openMailModal(button) {

        // Get the row to which the clicked button belongs
        var row = button.closest('tr');

        // Extract values from the row's cells
        var appointmentNumber = row.cells[0].textContent;
        var appointmentDate = row.cells[1].textContent;
        var testType = row.cells[2].textContent;
        var doctor = row.cells[3].textContent;
        var appointmentFee = row.cells[4].textContent;
        var modalPatientUsername = row.cells[6].textContent;
        var modalPatientName = row.cells[7].textContent;
        var modalPatientContact = row.cells[8].textContent;
        var modalPatientEmail = row.cells[9].textContent;

        // Populate the modal fields with these values
        document.getElementById('appointmentno').value = appointmentNumber.trim();
        document.getElementById('appointmentdte').value = appointmentDate.trim();
        document.getElementById('testtype').value = testType.trim();
        document.getElementById('doc').value = doctor.trim();
        document.getElementById('fee').value = appointmentFee.trim();
        document.getElementById('pname').value = modalPatientName.trim();
        document.getElementById('email').value = modalPatientContact.trim();

        // Finally, show the modal
        $('#mailModal').modal('show');
    }

    function saveResults() {

        var appointmentNumber = document.getElementById("modalAppointmentNumber").value;
        var username = document.getElementById("modalPatientUsername").value;
        var resultDate = document.getElementById("modalResultDate").value;
        var doctor = document.getElementById("modalDoctor").value;
        var technician = document.getElementById("modalTechnician").value;
        var testFee = document.getElementById("modalTestFee").value;
        var action = document.getElementById("action").value;


        $.ajax({
            method: "post",
            url: "forms/manage-results.jsp",
            data: {
                "action": action,
                "appointmentNumber": appointmentNumber,
                "username": username,
                "resultDate": resultDate,
                "doctor": doctor,
                "technician": technician,
                "testFee": testFee
            },
            success: function (response) {
                if (response.status === "success") {
                    swal("Good job!", "Successfully Uploaded !", "success");
                    window.location.reload("admin.jsp");

                } else {
                    swal("Error Response", "Failed !", "error");
                }

            },
            error: function (response) {
                swal("Error Response", "Failed !", "error");
            }
        });
    }

    function setTimeAndSendMail() {

        var appointmentNumber = document.getElementById("appointmentno").value;
        var appointmentTime = document.getElementById("appointmentTime").value;
        var appointmentdte = document.getElementById("appointmentdte").value;
        var testtype = document.getElementById("testtype").value;
        var doc = document.getElementById("doc").value;
        var fee = document.getElementById("fee").value;
        var pname = document.getElementById("pname").value;
        var email = document.getElementById("email").value;


        $.ajax({
            method: "post",
            url: "forms/manage-appointment.jsp",
            data: {
                "action": "sendMail",
                "appointmentno": appointmentNumber,
                "appointmentTime": appointmentTime,
                "appointmentdte": appointmentdte,
                "testtype": testtype,
                "doc": doc,
                "fee": fee,
                "pname": pname,
                "email": email
            },
            success: function (response) {
                if (response.status === "success") {
                    swal("Good job!", "Mail Send Successfully !", "success");
                    window.location.reload("admin.jsp");

                } else {
                    swal("Error Response", "Failed !", "error");
                }

            },
            error: function (response) {
                swal("Error Response", "Failed !", "error");
            }
        });
    }

    function downloadPDF(button) {
        var buttonId = button.id;
        window.open("http://localhost:8080/assets/img/appointments/"+buttonId+".pdf",'_blank');
    }


</script>
</html>