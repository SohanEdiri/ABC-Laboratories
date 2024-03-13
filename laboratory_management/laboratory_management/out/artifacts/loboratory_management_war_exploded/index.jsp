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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

<!-- ======= Top Bar ======= -->
<div id="topbar" class="d-flex align-items-center fixed-top">
  <div class="container d-flex align-items-center justify-content-center justify-content-md-between">
    <div class="align-items-center d-none d-md-flex">
      <i class="bi bi-clock"></i> Monday - Saturday, 8AM to 10PM
    </div>
    <div class="d-flex align-items-center">
      <i class="bi bi-phone"></i> Call us now +94 71 6253045
    </div>
  </div>
</div>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
  <div class="container d-flex align-items-center">

    <a href="index.jsp" class="logo me-auto logo_width"><img src="assets/img/logo1.png" alt="" style="width: 250px!important;"></a>

    <nav id="navbar" class="navbar order-last order-lg-0">
      <ul>
        <li><a class="nav-link scrollto " href="#hero">Home</a></li>
        <li><a class="nav-link scrollto" href="#about">About</a></li>
        <li><a class="nav-link scrollto" href="#doctors">Doctors</a></li>
      </ul>
      <i class="bi bi-list mobile-nav-toggle"></i>
    </nav><!-- .navbar -->

    <%
      if (session.getAttribute("username") != null){
    %>
    <a href="#appointment" class="appointment-btn scrollto"><span class="d-none d-md-inline">Make an</span> Appointment</a>
    <%
      System.out.println(session.getAttribute("userType"));
      Integer type = (Integer) session.getAttribute("userType");
        if (type == 2){
    %>
    <a href="patient.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">View My</span>Test Results</a>
    <%  }else {
    %>
    <a href="admin.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline">Admin</span>Dashboard</a>
    <%  }
    }%>
    <%
      if (session.getAttribute("username") != null){
    %>
    <a href="/login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline"></span> Log Out</a>
    <%}else {%>
    <a href="/login.jsp" class="appointment-btn scrollto"><span class="d-none d-md-inline"></span> Login</a>
    <%}%>

  </div>
</header><!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero">
  <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

    <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    <div class="carousel-inner" role="listbox">

      <!-- Slide 1 -->
      <div class="carousel-item active" style="background-image: url(assets/img/slide/slide-1.jpg)">
        <div class="container">
          <h2>Welcome to <span>ABC Laboratory</span></h2>
          <p>ABC`s healthcare laboratory automation solution drives delivery of quality healthcare results, operational efficiencies, improved laboratory fiscal management, and regulatory compliance.
            Hospitals  |  Public Health  |  Veterinary  |  Genetics & Molecular Pathology  |  Anatomic Pathology  |  Phlebotomy</p>
          <a href="#about" class="btn-get-started scrollto">Read More</a>
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-item" style="background-image: url(assets/img/slide/slide-2.jpg)">
        <div class="container">
          <h2>WHO WE ARE</h2>
          <p>Rather than competing in the healthcare industry, we chose instead to support consultants and healthcare professionals by offering highly complex and unique lab tests, with accompanying consultative support, to enhance their ability to provide an accurate diagnosis and comprehensive management of their patients.</p>
          <a href="#about" class="btn-get-started scrollto">Read More</a>
        </div>
      </div>

      <!-- Slide 3 -->
      <div class="carousel-item" style="background-image: url(assets/img/slide/slide-3.jpg)">
        <div class="container">
          <h2>WHAT WE DO</h2>
          <p>We support our healthcare professionals to succeed and lead the way in transitioning to a value-based healthcare model. Relying on our time-honoured expertise, we are empowering the industry with the most current testing knowledge, highly customized analysis and unparalleled guidance in implementing these tools to attain results.</p>
          <a href="#about" class="btn-get-started scrollto">Read More</a>
        </div>
      </div>

    </div>

    <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
    </a>

    <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
    </a>

  </div>
</section><!-- End Hero -->

<main id="main">

  <!-- ======= Featured Services Section ======= -->
  <section id="featured-services" class="featured-services">
    <div class="container" data-aos="fade-up">

      <div class="row">
        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
            <div class="icon"><i class="fas fa-heartbeat"></i></div>
            <h4 class="title"><a href="">Cardiac Diagnostics</a></h4>
            <p class="description">Experience unparalleled care and precision with ABC's state-of-the-art cardiovascular diagnostics.</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
            <div class="icon"><i class="fas fa-pills"></i></div>
            <h4 class="title"><a href="">Analytical Services</a></h4>
            <p class="description">Unlock the potential of precise diagnostics with ABC's detailed analytical services.</p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
            <div class="icon"><i class="fas fa-thermometer"></i></div>
            <h4 class="title"><a href="">Immunology & Vaccines</a></h4>
            <p class="description">ABC's commitment to excellence extends to our immunology and vaccine services. </p>
          </div>
        </div>

        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
          <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
            <div class="icon"><i class="fas fa-dna"></i></div>
            <h4 class="title"><a href="">Genomic Profiling</a></h4>
            <p class="description">Explore the building blocks of health with ABC's genetic testing capabilities. </p>
          </div>
        </div>

      </div>

    </div>
  </section><!-- End Featured Services Section -->

  <!-- ======= Cta Section ======= -->
  <section id="cta" class="cta">
    <div class="container" data-aos="zoom-in">

      <div class="text-center">
        <h3>In an emergency? Need help now?</h3>
        <p>We support our healthcare professionals to succeed and lead the way in transitioning to a value-based healthcare model. Relying on our time-honoured expertise, we are empowering the industry with the most current testing knowledge, highly customized analysis and unparalleled guidance in implementing these tools to attain results.</p>
        <%
            if (session.getAttribute("username") != null){
        %>
        <a class="cta-btn scrollto" href="#appointment">Make an Appointment</a>
        <%
          }else{
        %>
        <a class="cta-btn scrollto" href="/login.jsp">Please Login To Make an Appointment</a>
        <%
          }
        %>
      </div>

    </div>
  </section><!-- End Cta Section -->

  <!-- ======= Counts Section ======= -->
  <section id="counts" class="counts">
    <div class="container" data-aos="fade-up">

      <div class="row no-gutters">

        <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
          <div class="count-box">
            <i class="fas fa-user-md"></i>
            <span data-purecounter-start="0" data-purecounter-end="85" data-purecounter-duration="1" class="purecounter"></span>

            <p>Our dedicated team includes 85 seasoned physicians who are committed to providing exceptional patient care. </p>
            <a href="#">Find out more &raquo;</a>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
          <div class="count-box">
            <i class="far fa-hospital"></i>
            <span data-purecounter-start="0" data-purecounter-end="26" data-purecounter-duration="1" class="purecounter"></span>
            <p>With 26 specialized departments, our comprehensive healthcare network covers a vast array of medical fields. </p>
            <a href="#">Find out more &raquo;</a>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
          <div class="count-box">
            <i class="fas fa-flask"></i>
            <span data-purecounter-start="0" data-purecounter-end="14" data-purecounter-duration="1" class="purecounter"></span>
            <p>Our 14 cutting-edge research laboratories are at the forefront of medical innovation. </p>
            <a href="#">Find out more &raquo;</a>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
          <div class="count-box">
            <i class="fas fa-award"></i>
            <span data-purecounter-start="0" data-purecounter-end="150" data-purecounter-duration="1" class="purecounter"></span>
            <p>Proudly celebrating 150 awards of excellence in healthcare, our laboratory is recognized for outstanding patient services, an unwavering commitment to improving community health.</p>
            <a href="#">Find out more &raquo;</a>
          </div>
        </div>

      </div>

    </div>
  </section><!-- End Counts Section -->

  <!-- ======= Features Section ======= -->
  <section id="features" class="features">
    <div class="container" data-aos="fade-up">

      <div class="row">
        <div class="col-lg-6 order-2 order-lg-1" data-aos="fade-right">
          <div class="icon-box mt-5 mt-lg-0">
            <i class="bx bx-receipt"></i>
            <h4>Quality Assurance</h4>
            <p>Our rigorous protocols ensure the highest quality of laboratory management and patient care services.</p>
          </div>
          <div class="icon-box mt-5">
            <i class="bx bx-cube-alt"></i>
            <h4>Ethical Healthcare Standards</h4>
            <p>We uphold the strictest ethical standards, ensuring every procedure and decision is conducted with integrity.</p>
          </div>
          <div class="icon-box mt-5">
            <i class="bx bx-images"></i>
            <h4>Innovative Treatments</h4>
            <p>Embracing innovation, we continually adopt advanced techniques for improved patient outcomes.</p>
          </div>
          <div class="icon-box mt-5">
            <i class="bx bx-shield"></i>
            <h4>Pursuit of Knowledge</h4>
            <p>We are committed to expanding medical knowledge through continuous research and education.</p>
          </div>
        </div>
        <div class="image col-lg-6 order-1 order-lg-2" style='background-image: url("assets/img/features.jpg");' data-aos="zoom-in"></div>
      </div>

    </div>
  </section><!-- End Features Section -->

  <!-- ======= Services Section ======= -->
  <!-- End Services Section -->

  <!-- ======= Doctors Section ======= -->
  <section id="doctors" class="doctors section-bg">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Doctors</h2>
        <p>Our esteemed team of doctors brings together a wealth of expertise and a compassionate approach to medicine, ensuring every patient receives the highest standard of care. Specializing across a spectrum of medical fields, our physicians are equipped with cutting-edge tools and an unwavering commitment to patient health and well-being. Their collaborative efforts in both diagnosis and treatment embody the excellence and dedication at the heart of our healthcare services.</p>
      </div>

      <div class="row">

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="100">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-1.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Walter White</h4>
              <span>General Practitioner (Family Medicine Doctor)</span>
              <p>Orders a broad range of tests for initial diagnosis or health check-ups.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-2.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Sarah Jhonson</h4>
              <span>Internist (Internal Medicine Specialist)</span>
              <p>Focuses on adult medicine, ordering tests to diagnose and manage chronic diseases.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-3.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>William Anderson</h4>
              <span>Hematologist</span>
              <p>Specializes in blood disorders, ordering blood work to diagnose conditions like anemia, clotting disorders, and blood cancers.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-4.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Amanda Jepson</h4>
              <span>Urologist</span>
              <p>Orders urinalysis and other tests related to urinary tract disorders, male reproductive issues, and kidney function</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-5.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Nayana Jhonson</h4>
              <span>Nephrologist</span>
              <p>Specializes in kidney diseases, interpreting urinalysis and kidney function tests.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-6.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Kamal Anderson</h4>
              <span>Pathologist</span>
              <p>Examines tissue and blood samples to diagnose diseases, including cancers, through various laboratory tests.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-7.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>John Jepson</h4>
              <span>Geneticist</span>
              <p>Orders genetic testing for hereditary conditions, genetic disorders, and predisposition to certain diseases.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-8.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Nimal Jhonson</h4>
              <span>Obstetrician/Gynecologist (OB/GYN)</span>
              <p>Uses genetic testing and other laboratory tests for prenatal screening and reproductive health issues.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-9.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Sachin Anderson</h4>
              <span>Oncologist</span>
              <p>Specializes in cancer diagnosis and treatment, utilizing tissue pathology, cancer markers, and genetic tests.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-10.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Yasas Jepson</h4>
              <span>Infectious Disease Specialist</span>
              <p>Orders microbiological cultures and advanced diagnostics to identify infectious agents.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-11.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Nayana Jhonson</h4>
              <span>Cardiologist</span>
              <p>Focuses on heart and vascular conditions, ordering cardiac markers, lipid panels, and other cardiovascular tests.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-12.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Kavindu Anderson</h4>
              <span>Rheumatologist</span>
              <p>Orders inflammatory markers, autoantibodies, and other tests for autoimmune and rheumatic diseases.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-13.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Ananda Jepson</h4>
              <span>Endocrinologist</span>
              <p>Specializes in hormone-related disorders, ordering endocrine tests and metabolic panels.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="200">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-14.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Sarah Anderson</h4>
              <span>Gastroenterologist</span>
              <p>Uses gastrointestinal tests to diagnose conditions affecting the digestive system.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="300">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-15.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>William Gopallawa</h4>
              <span>Allergist/Immunologist</span>
              <p>Orders allergy testing and evaluates immune system disorders.</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
          <div class="member" data-aos="fade-up" data-aos-delay="400">
            <div class="member-img">
              <img src="assets/img/doctors/doctors-16.jpg" class="img-fluid" alt="">
            </div>
            <div class="member-info">
              <h4>Amanda Perera</h4>
              <span>Pulmonologist</span>
              <p> Specializes in lung and respiratory conditions, ordering respiratory tests and cultures to diagnose diseases like tuberculosis, pneumonia, and asthma.</p>
            </div>
          </div>
        </div>

      </div>

    </div>
  </section><!-- End Doctors Section -->

  <%if (session.getAttribute("username") != null){%>
  <!-- ======= Appointment Section ======= -->
  <section id="appointment" class="appointment section-bg">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Make an Appointment</h2>
        <p>Making an appointment with our healthcare professionals is the first step towards receiving the personalized and expert care you deserve. We offer a streamlined appointment process that respects your time and convenience, ensuring easy access to our wide range of medical services. Our dedicated staff is ready to assist you in scheduling a visit at a time that suits your needs, providing you with the support and attention necessary for your health journey.</p>
      </div>

        <input id="action" name="action" value="save" hidden>
        <div class="row">
          <div class="col-md-4 form-group mt-3">
            <input type="datetime" name="date" class="form-control datepicker" id="appointmentdate" placeholder="Appointment Date" required>
          </div>
          <div class="col-md-4 form-group mt-3">
            <select name="service" id="service" class="form-select" onchange="filterDoctors()" required>
              <option value="" disabled selected>Select Service</option>
              <option value="Blood Work">Blood Work</option>
              <option value="Urinalysis">Urinalysis</option>
              <option value="Vitamin and Mineral Levels">Vitamin and Mineral Levels</option>
              <option value="Inflammatory Markers">Inflammatory Markers</option>
              <option value="Advanced Diagnostics">Advanced Diagnostics</option>
              <option value="Microbiological Cultures">Microbiological Cultures</option>
              <option value="Cancer Markers">Cancer Markers</option>
              <option value="Tissue Pathology">Tissue Pathology</option>
              <option value="Genetic Testing">Genetic Testing</option>
              <option value="Hormonal Assays">Hormonal Assays</option>
              <option value="Cardiac Markers">Cardiac Markers</option>
              <option value="Autoantibodies">Autoantibodies</option>
              <option value="Endocrine Tests">Endocrine Tests</option>
              <option value="Bone Markers">Bone Markers</option>
              <option value="Metabolic Tests">Metabolic Tests</option>
              <option value="Allergy Testing">Allergy Testing</option>
              <option value="Gastrointestinal Tests">Gastrointestinal Tests</option>
              <option value="Respiratory Tests">Respiratory Tests</option>
            </select>
          </div>
          <div class="col-md-4 form-group mt-3">
            <select name="doctor" id="doctor" class="form-select" required>
              <option value="" disabled selected>Select Doctor</option>
              <option value="Walter White - General Practitioner (Family Medicine Doctor)" data-service="Blood Work,Urinalysis,Vitamin and Mineral Levels,Inflammatory Markers">Walter White - General Practitioner (Family Medicine Doctor)</option>
              <option value="Sarah Jhonson - Internist (Internal Medicine Specialist)" data-service="Blood Work">Sarah Jhonson - Internist (Internal Medicine Specialist)</option>
              <option value="William Anderson - Hematologist" data-service="Hormonal Assays">William Anderson - Hematologist</option>
              <option value="Amanda Jepson - Urologist" data-service="Urinalysis,Microbiological Cultures">Amanda Jepson - Urologist</option>
              <option value="Nayana Jhonson - Nephrologist" data-service="Urinalysis">Nayana Jhonson - Nephrologist</option>
              <option value="Kamal Anderson - Pathologist" data-service="Tissue Pathology">Kamal Anderson - Pathologist</option>
              <option value="John Jepson - Geneticist" data-service="Genetic Testing">John Jepson - Geneticist</option>
              <option value="Nimal Jhonson - Obstetrician/Gynecologist (OB/GYN)" data-service="Genetic Testing,Hormonal Assays">Nimal Jhonson - Obstetrician/Gynecologist (OB/GYN)</option>
              <option value="Sachin Anderson - Oncologist" data-service="Advanced Diagnostics,Cancer Markers,Tissue Pathology,Genetic Testing">Sachin Anderson - Oncologist</option>
              <option value="Yasas Jepson - Infectious Disease Specialist" data-service="Advanced Diagnostics,Microbiological Cultures">Yasas Jepson - Infectious Disease Specialist</option>
              <option value="Nayana Jhonson - Cardiologist" data-service="Advanced Diagnostics,Cardiac Markers">Nayana Jhonson - Cardiologist</option>
              <option value="Kavindu Anderson - Rheumatologist" data-service="Inflammatory Markers,Autoantibodies">Kavindu Anderson - Rheumatologist</option>
              <option value="Ananda Jepson - Endocrinologist" data-service="Vitamin and Mineral Levels,Hormonal Assays,Endocrine Tests,Bone Markers,Metabolic Tests">Ananda Jepson - Endocrinologist</option>
              <option value="Sarah Anderson - Gastroenterologist" data-service="Gastrointestinal Tests">Sarah Anderson - Gastroenterologist</option>
              <option value="William Gopallawa - Allergist/Immunologist" data-service="Autoantibodies,Allergy Testing">William Gopallawa - Allergist/Immunologist</option>
              <option value="Amanda Perera - Pulmonologist" data-service="Microbiological Cultures,Respiratory Tests">Amanda Perera - Pulmonologist</option>
            </select>
          </div>
        </div>

        <div class="form-group mt-3">
          <textarea class="form-control" id="message" name="message" rows="5" placeholder="Message (Optional)"></textarea>
        </div>
        <br>
        <div class="row">
          <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" value="cash" id="cashPayment">
            <label class="form-check-label" for="cashPayment">
              Cash Payment
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" value="card" id="cardPayment">
            <label class="form-check-label" for="cardPayment">
              Card Payment
            </label>
          </div>
          <div class="text-end col-md-9"><button type="button" class="btn btn-primary"style="background-color:#3fbbc0" onclick="createAppointment()" >Make an Appointment</button></div>
          <div class="col-md-3 form-group">
            <input type="text-right" name="appointmentFee" class="form-control" id="appointmentFee" placeholder="Appointment Fee" value="2000.00" disabled>
          </div>
        </div>


    </div>
  </section><!-- End Appointment Section -->

  <%}%>
  <!-- ======= Gallery Section ======= -->
  <section id="gallery" class="gallery">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Gallery</h2>
        <p>Our gallery showcases the state-of-the-art facilities and the compassionate moments that define our patient care experience, reflecting the essence of our commitment to health and healing.</p>
      </div>

      <div class="gallery-slider swiper">
        <div class="swiper-wrapper align-items-center">
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-1.jpg"><img src="assets/img/gallery/gallery-1.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-2.jpg"><img src="assets/img/gallery/gallery-2.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-3.jpg"><img src="assets/img/gallery/gallery-3.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-4.jpg"><img src="assets/img/gallery/gallery-4.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-5.jpg"><img src="assets/img/gallery/gallery-5.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-6.jpg"><img src="assets/img/gallery/gallery-6.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-7.jpg"><img src="assets/img/gallery/gallery-7.jpg" class="img-fluid" alt=""></a></div>
          <div class="swiper-slide"><a class="gallery-lightbox" href="assets/img/gallery/gallery-8.jpg"><img src="assets/img/gallery/gallery-8.jpg" class="img-fluid" alt=""></a></div>
        </div>
        <div class="swiper-pagination"></div>
      </div>

    </div>
  </section><!-- End Gallery Section -->

  <!-- ======= About Us Section ======= -->
  <section id="about" class="about">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>About Us</h2>
        <p>Rather than competing in the healthcare industry, we chose instead to support consultants and healthcare professionals by offering highly complex and unique lab tests, with accompanying consultative support, to enhance their ability to provide an accurate diagnosis and comprehensive management of their patients.</p>
      </div>

      <div class="row">
        <div class="col-lg-6" data-aos="fade-right">
          <img src="assets/img/about1.jpg" class="img-fluid" alt="">
        </div>
        <div class="col-lg-6 pt-4 pt-lg-0 content" data-aos="fade-left">
          <h3>WE ARE SRI LANKA'S HIGHEST ACCREDITED LABORATORY.</h3>
          <p class="fst-italic">
            ABC healthcare laboratory automation solution drives delivery of quality healthcare results, operational efficiencies, improved laboratory fiscal management, and regulatory compliance.
          </p>
          <ul>
            <li><i class="bi bi-check-circle"></i> Hospitals. </li>
            <li><i class="bi bi-check-circle"></i> Public Health. </li>
            <li><i class="bi bi-check-circle"></i> Genetics & Molecular Pathology.</li>
            <li><i class="bi bi-check-circle"></i> Anatomic Pathology.</li>
            <li><i class="bi bi-check-circle"></i> Phlebotomy.</li>
          </ul>

        </div>
        <p>
          We support our healthcare professionals to succeed and lead the way in transitioning to a value-based healthcare model. Relying on our time-honoured expertise, we are empowering the industry with the most current testing knowledge, highly customized analysis and unparalleled guidance in implementing these tools to attain results.
        </p>
      </div>

    </div>
  </section><!-- End About Us Section -->

  <!-- ======= Frequently Asked Questioins Section ======= -->
  <section id="faq" class="faq section-bg">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Frequently Asked Questions</h2>
        <p>Our Frequently Asked Questions provide quick, informative insights into our laboratory services, addressing preparations, procedures, and privacy with clarity. For further assistance, our dedicated team is ready to help you navigate your healthcare journey with ease.</p>
      </div>

      <ul class="faq-list">

        <li>
          <div data-bs-toggle="collapse" class="collapsed question" href="#faq1"> What types of tests can I have done at your laboratory? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
          <div id="faq1" class="collapse" data-bs-parent=".faq-list">
            <p>
              Our laboratory offers a comprehensive array of tests, including blood work, urinalysis, tissue pathology, genetic testing, and advanced diagnostics for a variety of conditions. We ensure each test is conducted with precision for accurate results.
            </p>
          </div>
        </li>

        <li>
          <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">How should I prepare for a lab test? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
          <div id="faq2" class="collapse" data-bs-parent=".faq-list">
            <p>
              Preparation for a lab test can vary depending on the specific analysis. Generally, some tests may require fasting, while others do not. We provide detailed instructions upon appointment booking to ensure reliable outcomes.
            </p>
          </div>
        </li>

        <li>
          <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">How long will it take to receive my test results? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
          <div id="faq3" class="collapse" data-bs-parent=".faq-list">
            <p>
              The turnaround time for test results can vary. Routine tests typically take 24-48 hours, while more complex analyses may take longer. Rest assured, we prioritize prompt reporting without compromising accuracy.
            </p>
          </div>
        </li>

        <li>
          <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">Are laboratory services covered by insurance? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
          <div id="faq4" class="collapse" data-bs-parent=".faq-list">
            <p>
              Many of our laboratory services are covered by insurance, but coverage can vary based on your plan and the test required. We recommend checking with your insurance provider beforehand, and our staff can assist with any required documentation.
            </p>
          </div>
        </li>

        <li>
          <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">How do you ensure the confidentiality and security of my test results? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
          <div id="faq5" class="collapse" data-bs-parent=".faq-list">
            <p>
              We adhere to strict privacy policies and use secure systems to protect your personal health information. Test results are only shared with authorized individuals, and we comply with all HIPAA regulations to maintain confidentiality.
            </p>
          </div>
        </li>

      </ul>

    </div>
  </section><!-- End Frequently Asked Questioins Section -->

  <!-- ======= Contact Section ======= -->
  <!-- End Contact Section -->

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
    function filterDoctors() {
        var serviceSelected = document.getElementById('service').value;
        var doctorOptions = document.getElementById('doctor').options;

        // Reset doctor selection to the placeholder when dao changes
        document.getElementById('doctor').value = "";

        // Iterate over each doctor option in the dropdown
        for (var i = 0; i < doctorOptions.length; i++) {
            var option = doctorOptions[i];
            var services = option.getAttribute('data-service');

            // Check if the option's data-dao attribute contains the selected dao
            if (services && services.split(',').includes(serviceSelected) || option.value === "") {
                option.style.display = "block"; // Show relevant doctor option
            } else {
                option.style.display = "none"; // Hide irrelevant doctor option
            }
        }
    }

    function createAppointment() {

        var appointmentdate=document.getElementById("appointmentdate").value;
        var service=document.getElementById("service").value;
        var doctor=document.getElementById("doctor").value;
        var action=document.getElementById("action").value;
        var message=document.getElementById("message").value;
        var appointmentFee=document.getElementById("appointmentFee").value;

        $.ajax({
            method: "post",
            url: "forms/manage-appointment.jsp",
            data: {
                "action": action,
                "appointmentdate": appointmentdate,
                "service": service,
                "doctor": doctor,
                "message" :message,
                "appointmentFee" :appointmentFee
            },
            success: function (response) {
                if(response.status === "success"){
                    swal("Good job!", "Successfully Created New Appointment", "success");
                    window.location.reload("index.jsp");
                }else {
                    swal("Error Response", "Failed !", "error");
                }

            },
            error: function (response) {
                swal("Error Response", "Failed !", "error");
            }
        });
    }
</script>
</html>