<%-- 
    Document   : viewProfile
    Created on : May 31, 2016, 12:55:14 PM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
<%@page import="Controller.SearchDoctor"%>
<%@page import="Controller.DBDataList"%>
<%@page import="Model.Doctor"%>
<%@page import="java.io.OutputStream"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb">
        <%
            if (session.getAttribute("user") != null) {
                User usr = (User) session.getAttribute("user");
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
                        <div class="box-body col-md-12" style="border-style: solid;border-left-color: #204d74;border-bottom: none;border-right: none;border-top: none;padding-top: 40px;padding-bottom: 30px;background-color: whitesmoke">
                            <div class="row">
                                <div class="col-md-3" >
                                    <img class="center-block" src="img/userA.png" alt="profile picture" height="200" width="200"/>
                                </div>
                                <div class="col-md-9">
                                    <div class="row">
                                        <label class="control-label col-md-3">FIRST NAME</label>
                                        <label class="control-label col-md-9"><%= usr.getFname() %></label>                  
                                    </div>

                                    <div class="row">   
                                        <label class="control-label col-md-3">LAST NAME</label>
                                        <label class="control-label col-md-9"><%= usr.getLname() %></label> 
                                    </div>
                                    <div class="row">     
                                        <label class="control-label col-md-3">NIC NUMBER</label>
                                        <label class="control-label col-md-9"><%= usr.getNic() %></label> 
                                    </div>    

                                    <div class="row">
                                        <label class="control-label col-md-3">ADDRESS</label>
                                        <label class="control-label col-md-9"><%= usr.getAddress() %></label> 
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-md-3">E-MAIL</label>
                                        <label class="control-label col-md-9"><%= usr.getEmail() %></label> 
                                    </div>
                                    <div class="row" >
                                        <div class="col-md-offset-10">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Edit</button>

                                            <!-- Modal -->
                                            <div id="myModal" class="modal fade" role="dialog">
                                                <div class="modal-dialog">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Edit your Profile</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form class="form-horizontal" action="UpdateUserDetails" method="POST">
                                                                <div class="box-body col-sm-12" >
                                                                    <div>                                                                                                                                               
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">FIRST NAME</label>
                                                                            <div class="col-md-9">
                                                                                <input id = "fname" name = "fname" type = "text" class = "form-control" value="<%= usr.getFname()%>">
                                                                            </div>                     
                                                                        </div>

                                                                        <div class="form-group col-md-12">   
                                                                            <label class="control-label col-md-3">LAST NAME</label>
                                                                            <div class="col-md-9">
                                                                                <input id = "lname" name = "lname" type = "text" class = "form-control" value="<%= usr.getLname()%>" >
                                                                            </div>


                                                                        </div>
                                                                        <div class="form-group col-md-12">     
                                                                            <label class="control-label col-md-3">NIC NUMBER</label>
                                                                            <div class="col-md-9">
                                                                                <input id = "nic" name = "nic" type = "text" class = "form-control" value="<%= usr.getNic()%>">    
                                                                            </div>
                                                                        </div>    

                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">ADDRESS</label>
                                                                            <div class="col-md-9">
                                                                                <textarea name = "address" rows = "2" cols = "30" class = "form-control" ><%= usr.getAddress()%></textarea>                                  
                                                                            </div>
                                                                        </div>

                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">E-MAIL</label>
                                                                            <div class="col-md-9">
                                                                                <input id = "email" name = "email" type = "email" class = "form-control" value="<%= usr.getEmail()%>">    
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <div class="col-md-9">
                                                                                <input id = "type" name = "type" type = "hidden" class = "form-control" value="<%= usr.getUserLevel()%>" >    
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <div class="col-md-9">
                                                                                <input id = "type" name = "type" type = "hidden" class = "form-control" value="<%= usr.getUserLevel()%>" hidden="">    
                                                                            </div>
                                                                        </div>
                                                                        <%
                                                                            if (usr.getUserLevel().equals("Doctor")) {
                                                                                Doctor doc = (Doctor) usr;
                                                                        %>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">FIELD</label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "doctype" name = "doctype" type = "text" class = "form-control" value ="<%= doc.getField()%>">    
                                                                            </div>
                                                                        </div> 
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">WORKING HOSPITAL</label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "hospital" name = "hospital" type = "text" class = "form-control" value ="<%= doc.getHospital()%>">    
                                                                            </div>
                                                                        </div>
                                                                        <%
                                                                        } else if (usr.getUserLevel().equals("Patient")) {
                                                                            Patient ptn = (Patient) usr;
                                                                        %>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">DESCRIPTION</label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "description" name = "description" type = "text" class = "form-control" value ="<%= ptn.getDescription() %>">    
                                                                            </div>
                                                                        </div> 
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">WARD NUMBER</label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "wardnumber" name = "wardnumber" type = "text" class = "form-control" value ="<%= ptn.getWard_number() %>">    
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">ADMITTED DATE </label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "admitteddate" name = "admitteddate" type = "date" class = "form-control" value ="<%= ptn.getAdmitted_date() %>">    
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group col-md-12">
                                                                            <label class="control-label col-md-3">DISCHARGED DATE </label>
                                                                            <div 
                                                                                class="col-md-9">
                                                                                <input id = "dischargeddate" name = "dischargeddate" type = "date" class = "form-control" value ="<%= ptn.getDischarged_date() %>">    
                                                                            </div>
                                                                        </div>
                                                                        <%                                                                            }
                                                                        %>

                                                                        <div class="box-footer">
                                                                            <div class="form-group col-sm-12">
                                                                                <!--<div class="col-sm-offset-2 col-sm-10">-->
                                                                                <button type="submit" class="btn btn-primary center-block" >Save Changes</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div class="col-md-3" style="margin-left: -50px">
                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal1" style="float: right">Change Profile Picture</button>
                                    <div id="myModal1" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Change your Profile Picture</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" action="UploadImage" method="POST" enctype="multipart/form-data">
                                                        <div class="box-body col-sm-12" >
                                                            <div>
                                                                <div class="form-group col-md-12">
                                                                    <label class="control-label col-md-3">Browse Image</label>
                                                                    <div class="col-md-9">
                                                                        <input id = "photo" name = "photo" type = "file" class = "form-control" size="50" >
                                                                    </div>                     
                                                                </div>                                                       
                                                                <div class="box-footer">
                                                                    <div class="form-group col-sm-12">
                                                                        <!--<div class="col-sm-offset-2 col-sm-10">-->
                                                                        <button type="submit" class="btn btn-primary center-block" >Change Photo</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%
                                    byte[] imgData = null;
                                    if (session.getAttribute("user") != null) {
                                        User user1 = (User) session.getAttribute("user");
                                        if (user1.getProfpic() != null) {
                                            imgData = user1.getProfpic().getBytes(1, (int) user1.getProfpic().length());
                                            response.setContentType("image/gif");
                                            //out.clear();
                                            try {
                                                OutputStream o = response.getOutputStream();
                                                o.write(imgData);
                                                o.flush();
                                                o.close();
                                            } catch (Exception e) {
                                                System.out.println(e);
                                                //out.println("Error occured in here");
                                                System.out.println("Chandu Bandara");
                                                System.out.println(user1.getFname());
                                                System.out.println(user1.getProfpic().toString());
                                                //                                            user1.getFname();
                                            }
                                        }
                                    }
                                %>

                            </div>
                        </div>
                    </div>
                </div>
            </div>            <!-- /#page-content-wrapper -->
        </div>
        <% } else {
                response.sendRedirect("login.jsp");
            }
        %>

        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
        </script>
    </body>
</html>
