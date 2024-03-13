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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>
<%

    AppointmentDAO appointmentDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.APPOINTMENT);
    QueryDAO queryDAO = ObjectFactory.getInstance().getObject(ObjectFactory.ObjectTypes.QUERY);
    ArrayList<Appointment> appointments = null;
    ArrayList<ApointmentTestResults> testResults = null;
    String username = (String) session.getAttribute("username");

    try {
        if (username == null) return;
        appointments = appointmentDAO.getUserWiseList(username);
        testResults = queryDAO.getUserWiseResults(username);
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
        <%--<a href="index.jsp#appointment" class="appointment-btn scrollto"><span class="d-none d-md-inline">Make an</span> Appointment</a>--%>
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
                <h4>Your Pending Appointments</h4>
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
                            <th>Your Message</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            if (appointments != null && appointments.size()>0){
                                for(Appointment appointment:appointments) {
                        %>
                        <tr>
                            <td><%=appointment.getAppointmentNumber()%></td>
                            <td><%=appointment.getAppointmentDate()%></td>
                            <td><%=appointment.getServiceType()%></td>
                            <td><%=appointment.getDoctor()%></td>
                            <td><%=appointment.getAppointmentFee()%></td>
                            <td><%=appointment.getMessage()%></td>

                        </tr>
                        <%      }
                            }else {%>
                        <tr>No Results Found</tr>
                        <%  }
                        %>
                        </tbody>
                    </table>
                </div>

            </div>
<br><br><br>
            <div class="section-title">
                <h4>Your Test Results</h4>
            </div>

            <div class="row">
                <div class="container mt-3">
                    <input type="text" id="searchInput2" onkeyup="filterTable('searchInput2', 'appointmentsTable2')" placeholder="Search for appointments..." class="form-control mb-3">
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
                            if (testResults != null && testResults.size()>0){
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
                            <td><button class="btn btn-primary" style="background-color:#65c9cd ; font-size: 13px" onclick="downloadPDF(this)" id="<%=results.getTestResultId()%>">View & Download</button></td>

                        </tr>
                        <%      }
                            }else {%>
                        <tr>No Results Found</tr>
                        <%}%>
                        <!-- More rows as needed -->
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </section><!-- End Appointment Section -->

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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>
<script>

    $(document).ready(function(){
        $("#appointmentdate").datepicker({
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

    function downloadPDF(button) {
        var buttonId = button.id;
        window.open("http://localhost:8080/assets/img/appointments/"+buttonId+".pdf",'_blank');
    }

</script>
</html>