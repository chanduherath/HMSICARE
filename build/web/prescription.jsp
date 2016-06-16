<%-- 
    Document   : prescription
    Created on : May 30, 2016, 9:15:56 PM
    Author     : Chandu Herath
--%>

<%@page import="Controller.SearchDoctor"%>
<%@page import="Model.Doctor"%>
<%@page import="Model.Patient"%>
<%@page import="Controller.SearchPatient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #d9e6e6">
        <%
            if (session.getAttribute("user") != null) {
                User us12 = (User) session.getAttribute("user");
                SearchDoctor sd = new SearchDoctor();
                Doctor doc = (Doctor) sd.getDoctorByUserID(us12.getUserId());
                int userID = Integer.parseInt(request.getParameter("patientUserID"));
                SearchPatient sp = new SearchPatient();
                Patient p = sp.getPatientByUserID(userID);
        %>
        <div id="wrapper" >
            <%@include file="sidebarMenu.jsp" %>
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid" >
                    <div class="row" style="margin-left: -35px;margin-right: -35px;margin-top: -20px">
                        <%@include file="header.jsp" %>
                    </div>

                    <div class="raw">
                        <div class="col-md-offset-3 col-md-6">
                            <form id="prescriptionform" data-toggle="validator" class="form-horizontal" action="SavePrescription" method="POST">                       
                                <table class="table table-bordered ">
                                    <tr>
                                        <th colspan="12" style="text-align: center" class="info"> Medical Prescription</th>
                                    <tr>

                                    <tr>
                                        <td colspan="6" style="width: 50%" class="info">Name of the Patient</td>                    
                                        <td colspan="6" style="width: 50%"><label class = "control-label"><%= p.getFname() + " " + p.getLname()%></label></td>
                                    </tr>

                                    <tr>
                                        <td colspan="3" style="width: 25%" class="info">Date of Birth</td>
                                        <td colspan="3" style="width: 25%"><label class = "control-label">04.05.1993</label></td>
                                        <td colspan="3" style="width: 25%" class="info">Age</td>
                                        <td colspan="3" style="width: 25%"><label class = "control-label">23</label></td>
                                    </tr>

                                    <tr>
                                        <td colspan="6" style="width: 50%" class="info">Date</td>
                                        <td colspan="6" style="width: 50%" class="form-group"><input name="date" type="date" class="form-control" required=""></td>
                                    </tr> 

                                    <tr>
                                        <td colspan="3" style="width: 25%" class="info">Diagnosed With</td>
                                        <td colspan="9" style="width: 75%" class="form-group"><input name="diagnosed" type="text" class="form-control" placeholder="Diagnosed With" maxlength="20" pattern="[A-Za-z ]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 25%" class="info">Blood Pressure</td>
                                        <td colspan="3" style="width: 25%" class="form-group"><input name="pressure" type="text" class="form-control" placeholder="Blood Pressure" pattern="[0-9]*(\.[0-9]+)?" data-error=""></td>
                                        <td colspan="3" style="width: 25%" class="info">Pulse Rate</td>
                                        <td colspan="3" style="width: 25%" class="form-group"><input name="pulseRate" type="text" class="form-control" placeholder="Pulse Rate" pattern="[0-9]*(\.[0-9]+)?"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="info" >Drug</td>                   
                                        <td colspan="4" style="width: 34%" class="info">Unit(Tablet or Syrup)</td>                    
                                        <td colspan="4" style="width: 33%" class="info">Dosage(Per Day)</td>                  
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="drug1" type="text" class="form-control"  maxlength="15" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 34%" class="form-group"><input name="unit1" type="text" class="form-control" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="dosage1" type="text" class="form-control" pattern="[0-9]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="drug2" type="text" class="form-control"  maxlength="15" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 34%" class="form-group"><input name="unit2" type="text" class="form-control" pattern="[A-Za-z0-9]+"></td>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="dosage2" type="text" class="form-control" pattern="[A-Za-z0-9]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="drug3" type="text" class="form-control"  maxlength="15" pattern="[A-Za-z0-9 ]+" ></td>
                                        <td colspan="4" style="width: 34%" class="form-group"><input name="unit3" type="text" class="form-control" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="dosage3" type="text" class="form-control" pattern="[A-Za-z0-9]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="drug4" type="text" class="form-control"  maxlength="15" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 34%" class="form-group"><input name="unit4" type="text" class="form-control" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="dosage4" type="text" class="form-control" pattern="[A-Za-z0-9]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="drug5" type="text" class="form-control"  maxlength="15" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 34%" class="form-group"><input name="unit5" type="text" class="form-control" pattern="[A-Za-z0-9 ]+"></td>
                                        <td colspan="4" style="width: 33%" class="form-group"><input name="dosage5" type="text" class="form-control" pattern="[A-Za-z0-9]+"></td>
                                    </tr>

                                    <tr>
                                        <td colspan="3" style="width: 25%" class="info">Examination to be done(if any)</td>                
                                        <td colspan="9" style="width: 75%" class="form-group"><input name="tests" type="text" class="form-control" placeholder="Any Tests?" maxlength="20" pattern="[A-Za-z0-9 ]+"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 25%" class="info">Things to Follow</td>
                                        <td colspan="9" style="width: 75%" class="form-group"><input name="follow" type="text" class="form-control" placeholder="Things to Follow?" maxlength="20" pattern="[A-Za-z0-9 ]+"></td>
                                    </tr>
                                    <input id="patientID" name="patientID" type="hidden" value="<%= p.getPatient_id()%>">
                                    <input id="docID" name="docID" type="hidden" value="<%= doc.getDoc_id()%>">
                                    <input id="userID" name="userID" type="hidden" value="<%= p.getUserId()%>">
                                </table>

                                <a href="patientProfile.jsp?patientUserID=<%= userID%>" class="btn btn-info">Cancel</a>
                                <button type="submit" class="btn btn-info"> Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>            <!-- /#page-content-wrapper -->
        </div>
        <% } else {
                response.sendRedirect("login.jsp");
            }
        %>
        <script>
           
        </script>
        <!-- Menu Toggle Script -->
        <script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
             $('#prescriptionform').validator();
        </script>

    </body>
</html>
