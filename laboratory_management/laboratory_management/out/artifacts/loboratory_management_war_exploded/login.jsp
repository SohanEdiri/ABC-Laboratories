<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        .modal-login {
            color: #636363;
            width: 350px;
        }
        .modal-login .modal-content {
            padding: 20px;
            border-radius: 5px;
            border: none;
        }
        .modal-login .modal-header {
            border-bottom: none;
            position: relative;
            justify-content: center;
        }
        .modal-login h4 {
            text-align: center;
            font-size: 26px;
            margin: 30px 0 -15px;
        }
        .modal-login .form-control:focus {
            border-color: #70c5c0;
        }
        .modal-login .form-control, .modal-login .btn {
            min-height: 40px;
            border-radius: 3px;
        }
        .modal-login .close {
            position: absolute;
            top: -5px;
            right: -5px;
        }
        .modal-login .modal-footer {
            background: #ecf0f1;
            border-color: #dee4e7;
            text-align: center;
            justify-content: center;
            margin: 0 -20px -20px;
            border-radius: 5px;
            font-size: 13px;
        }
        .modal-login .modal-footer a {
            color: #999;
        }
        .modal-login .avatar {
            position: absolute;
            margin: 0 auto;
            left: 0;
            right: 0;
            top: -70px;
            width: 95px;
            height: 95px;
            border-radius: 50%;
            z-index: 9;
            background: #60c7c1;
            padding: 15px;
            box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
        }
        .modal-login .avatar img {
            width: 100%;
        }
        .modal-login.modal-dialog {
            margin-top: 80px;
        }
        .modal-login .btn, .modal-login .btn:active {
            color: #fff;
            border-radius: 4px;
            background: #60c7c1 !important;
            text-decoration: none;
            transition: all 0.4s;
            line-height: normal;
            border: none;
        }
        .modal-login .btn:hover, .modal-login .btn:focus {
            background: #45aba6 !important;
            outline: none;
        }
        #myModalCreate {
            display: none; /* Hide the div initially */
        }

    </style>
</head>
<body>

<%
session.invalidate();
%>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">
                    <img src="/assets/img/avatar.png" alt="Avatar">
                </div>
                <h4 class="modal-title">Member Login</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="window.location.href='index.jsp';">&times;</button>
            </div>
            <div class="modal-body">
                    <div class="form-group">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" required="required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                        <button type="button" onclick="loginUser()" class="btn btn-primary btn-lg btn-block login-btn">Login</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" onclick="showCreateAccountModal()" class="btn btn-primary btn-lg btn-block login-btn">Create New Account</button>
                    </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-3" id="myModalCreate">

        <div class="row jumbotron box8">
            <div class="col-sm-12 mx-t3 mb-4">
                <h2 class="text-center text-info">Patient Register</h2>
            </div>
            <div class="col-sm-6 form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Enter your name." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="nic">NIC</label>
                <input type="text" class="form-control" name="nic" id="nic" placeholder="Enter your NIC." >
            </div>
            <div class="col-sm-6 form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="address">Address</label>
                <input type="address" class="form-control" name="address" id="address" placeholder="Enter your Address." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="contact">Contact Number</label>
                <input type="contact" class="form-control" name="contact" id="contact" placeholder="Enter your Contact Number" required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="age">Age</label>
                <input type="age" class="form-control" name="age" id="age" placeholder="Enter your Age." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="gender">Gender</label>
                <select id="gender" class="form-control browser-default custom-select">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>
            <div class="col-sm-6 form-group">
                <label for="username1">Username</label>
                <input type="username1" class="form-control" name="username1" id="username1" placeholder="Enter your Username." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="pass">Password</label>
                <input type="Password" name="password" class="form-control" id="pass" placeholder="Enter your password." required>
            </div>
            <div class="col-sm-6 form-group">
                <label for="pass2">Confirm Password</label>
                <input type="Password" name="cnf-password" class="form-control" id="pass2" placeholder="Re-enter your password." required>
            </div>
            <div class="col-sm-12">
                <input type="checkbox" class="form-check d-inline" id="chb" required><label for="chb" class="form-check-label">&nbsp;I accept all terms and conditions.
            </label>
            </div>

            <div class="col-sm-12 form-group mb-0">
                <button onclick="signUpUser()" style="background-color: #60c7c1 !important;" class="btn btn-primary float-right">Submit</button>
                <button onclick="hideCreateAccountModal()" style="margin-right: 10px" class="btn btn-danger float-right">Cancel</button>
            </div>

        </div>

</div>
</body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        $("#myModal").modal('show');
        $("#myModalCreate")('hide');

        $('#myModal').on('hide.bs.modal', function (e) {
            e.preventDefault();
            window.location.href = 'index.jsp';
        });
    });

//    $('#myModal').on('hide.bs.modal', function (e) {
//        e.preventDefault();
//        window.location.href = 'index.jsp';
//    });

    function showCreateAccountModal() {
        // Directly hide the login modal without waiting for the event
        $('#myModal').modal('hide');

        document.getElementById('myModalCreate').style.display = 'block';
    }

    function hideCreateAccountModal() {
        // Directly hide the login modal without waiting for the event
        $('#myModal').modal('hide');

        document.getElementById('myModalCreate').style.display = 'none';
        window.location.href = 'index.jsp';
    }

    function loginUser() {

        var user_name=document.getElementById("username").value;
        var password=document.getElementById("password").value;

        $.ajax({
            method: "post",
            url: "forms/manage-users.jsp",
            data: {
                "action": "login",
                "user_name": user_name,
                "password": password
            },
            success: function (response) {
                if (response.status === "success") {
//                      swal("Good job!", "Login Success", "success");
                    window.location.href="index.jsp";
                }else {
                    swal("Error Response", "Invalid Username or Password !", "error");
                }
            },
            error: function (response) {

                console.log(response.toString() );
                swal("Error Response", "Invalid Username or Password !", "error");
            }
        });
    }

    function signUpUser() {

        var name = document.getElementById("name").value;
        var nic = document.getElementById("nic").value;
        var email = document.getElementById("email").value;
        var address = document.getElementById("address").value;
        var contact = document.getElementById("contact").value;
        var age = document.getElementById("age").value;
        var gender = document.getElementById("gender").value;
        var username1 = document.getElementById("username1").value;
        var pass = document.getElementById("pass").value;
        var pass2 = document.getElementById("pass2").value;

        if (pass === pass2) {
            $.ajax({
                method: "post",
                url: "forms/manage-users.jsp",
                data: {
                    "action": "save",
                    "name": name,
                    "nic": nic,
                    "email": email,
                    "address": address,
                    "contact": contact,
                    "age": age,
                    "gender": gender,
                    "pass": pass,
                    "username1" : username1
                },
                success: function (response) {
                    if(response.status === "success"){
                        swal("Good job!", "Successfully Created New User", "success");
                        window.location.href = 'index.jsp';
                    }else {
                        swal("Error Response", "Failed !", "error");
                    }

                },
                error: function (response) {
                    swal("Error Response", "Failed !", "error");
                }
            });
        }else{
            swal("Error Response", "Passwords Does Not Match", "error");
        }
    }
</script>
</html>