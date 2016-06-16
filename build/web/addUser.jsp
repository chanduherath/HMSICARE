<%-- 
    Document   : addUser
    Created on : May 30, 2016, 9:43:10 PM
    Author     : Chandu Herath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE Add User</title>
        <%@include file="stylesAndScripts.jsp" %>
        <script type="text/javascript">
            function change(obj) {
//                $("#parent").css("display", "");
                var selectBox = obj;
                var selected = selectBox.options[selectBox.selectedIndex].value;
                if (selected === 'def') {
                    $("#admitteddate").css("display", "block");
                    $("#wardnumber").css("display", "block");
                    $("#description").css("display", "block");
                    $("#doctype").css("display", "block");
                    $("#hospital").css("display", "block");
                    $("#labassistype").css("display", "block");
                } else if (selected === 'Patient') {
                    $("#doctype").css("display", "none");
                    $("#hospital").css("display", "none");
                    $("#admitteddate").css("display", "block");
                    $("#wardnumber").css("display", "block");
                    $("#description").css("display", "block");
                    $("#labassistype").css("display", "none");
                } else if (selected === 'Doctor') {
                    $("#admitteddate").css("display", "none");
                    $("#wardnumber").css("display", "none");
                    $("#description").css("display", "none");
                    $("#doctype").css("display", "block");
                    $("#hospital").css("display", "block");
                    $("#labassistype").css("display", "none");
                } else if (selected === 'Receptionist') {
                    $("#doctype").css("display", "none");
                    $("#hospital").css("display", "none");
                    $("#admitteddate").css("display", "none");
                    $("#wardnumber").css("display", "none");
                    $("#description").css("display", "none");
                    $("#labassistype").css("display", "none");
                } else if (selected === 'LabAssistant') {
                    $("#doctype").css("display", "none");
                    $("#hospital").css("display", "none");
                    $("#admitteddate").css("display", "none");
                    $("#wardnumber").css("display", "none");
                    $("#description").css("display", "none");
                    $("#labassistype").css("display", "block");
                } else {
                    $("#doctype").css("display", "none");
                    $("#hospital").css("display", "none");
                    $("#admitteddate").css("display", "none");
                    $("#wardnumber").css("display", "none");
                    $("#description").css("display", "none");
                    $("#labassistype").css("display", "none");
                }
            }
        </script>
    </head>
    <body style="background-color: #e4ebeb">
        <%
            if (session.getAttribute("user") != null) {
                User userper = (User) session.getAttribute("user");
                if (userper.getUserLevel().equals("admin")) {
        %>
        <div id="wrapper" >
            <%@include file="sidebarMenu.jsp" %>
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid" >
                    <div class="row" style="margin-left: -35px;margin-right: -35px;margin-top: -20px">
                        <%@include file="header.jsp" %>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6">
                            <%                    if (request.getParameter("msg") != null) {
                                    if (request.getParameter("msg").equals("error")) {
                            %>
                            <div class="alert alert-danger">
                                <strong>Warning!</strong> Oops..! Something Went Wrong. Please Try Again.
                            </div>
                            <%
                            } else if (request.getParameter("msg").equals("success")) {
                            %>
                            <div class="alert " style="background-color: #67a05d">
                                <strong>Success!</strong> User Registration Successfully Completed.
                            </div>
                            <%
                                    }
                                }
                            %>

                            <div class="box box-info" style="padding: 20px;margin-top: 20px;" >
                                <form id="adduserform" data-toggle="validator" class="form-horizontal" action="SaveUser" method="POST">
                                    <div class="box-body col-sm-12" style="border-style: solid;border-left-color: #204d74;border-bottom: none;border-right: none;border-top: none;padding-top: 40px;padding-bottom: 30px;background-color: whitesmoke">
                                        <div style="padding-left: 30px">
                                            <div class = "form-group col-sm-12">                   
                                                <select  id="type" name="type" class="form-control" required onchange="change(this)">
                                                    <option value="def" selected="" disabled="">Select the user type</option>
                                                    <option value="Doctor"  >Doctor</option>
                                                    <option value="Receptionist"  >Receptionist</option>
                                                    <option value="Patient"  >Patient</option>
                                                    <option value="LabAssistant"  >Laboratory Assistant</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-sm-12">                               
                                                <input id = "fname" name = "fname" type = "text" class = "form-control" placeholder = "FIRST NAME" style="border-radius: 0px" required="" pattern="[A-Za-z]+">
                                            </div>
                                            <div class="form-group col-sm-12">     
                                                <input id = "lname" name = "lname" type = "text" class = "form-control" placeholder = "LAST NAME" style="border-radius: 0px" required="" pattern="[A-Za-z]+">
                                            </div>
                                            <div class="form-group col-sm-12">              
                                                <input id = "nic" name = "nic" type = "text" class = "form-control" placeholder = "NIC NUMBER" style="border-radius: 0px" required="" pattern="[0-9]{9}[A-Za-z]">
                                            </div>                 
                                            <div class="form-group col-sm-12">
                                                <textarea name = "address" rows = "2" cols = "30" class = "form-control" placeholder = "ADDRESS" style="border-radius: 0px" pattern="[A-Za-z]+"></textarea>
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <input id = "email" name = "email" type = "email" class = "form-control" placeholder = "EMAIL" style="border-radius: 0px" required="">
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <input id = "username" name = "username" type = "text" class = "form-control" placeholder = "USER_NAME" style="border-radius: 0px" pattern="[A-Za-z]+">
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <input id = "password" name = "password" type = "password" class = "form-control" placeholder = "PASSWORD" style="border-radius: 0px" required="" data-minlength="6">
                                            </div>
                                            <div class="form-group col-sm-12">
                                                <input id = "conpassword" name = "conpassword" type = "password" class = "form-control" placeholder = "CONFIRM PASSWORD" style="border-radius: 0px" data-match="#password" data-match-error="Whoops, these don't match">                                  
                                            </div>

                                            <!--This area is for patients -->
                                            <div id="description" class="form-group col-sm-12" style="display: none">
                                                <textarea  name = "description" rows = "2" cols = "30" class = "form-control" placeholder = "DESCRIPTION" style="border-radius: 0px;" required=""></textarea>
                                            </div>
                                            <div id = "wardnumber" class="form-group col-sm-12" style="display: none">
                                                <input  name = "wardnumber" type = "number" class = "form-control" placeholder = "WARD NUMBER" style="border-radius: 0px;">
                                            </div>
                                            <div id = "admitteddate" class="form-group col-sm-12" style="display: none">
                                                <input  name = "admitteddate" type = "date" class = "form-control" placeholder = "ADDMITTED DATE" style="border-radius: 0px;" required="">
                                            </div>

                                            <!--this area is for doctors-->
                                            <div id = "doctype" class="form-group col-sm-12" style="display: none"> 
                                                <input  name = "doctype" type = "text" class = "form-control" placeholder = "DOCTOR TYPE" style="border-radius: 0px;" required="">
                                            </div>
                                            <div id = "hospital" class="form-group col-sm-12" style="display: none" >
                                                <input  name = "hospital" type = "text" class = "form-control" placeholder = "WORKING HOSPITAL" style="border-radius: 0px;" required="" pattern="[A-Za-z]+">
                                            </div>

                                            <!--this area is for Lab Assistant-->
                                            <div id = "labassistype" class="form-group col-sm-12" style="display: none" >
                                                <input  name = "labassistype" type = "text" class = "form-control" placeholder = "TYPE" style="border-radius: 0px;" pattern="[A-Za-z]+">
                                            </div>

                                            <div class="box-footer">
                                                <div class="form-group col-sm-12">
                                                    <!--<div class="col-sm-offset-2 col-sm-10">-->
                                                    <button type="submit" class="btn btn-primary btn-lg center-block" style="border-radius: 0px">REGISTER</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>            <!-- /#page-content-wrapper -->
        </div>
        <% } else {
                    response.sendRedirect("404error.jsp");
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- Menu Toggle Script -->
        <script>
            $(#loginform).validator();
        </script>
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
