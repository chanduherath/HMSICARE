<%-- 
    Document   : searchResultsPatients
    Created on : May 31, 2016, 10:16:10 AM
    Author     : Chandu Herath
--%>

<%@page import="Model.Patient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.SearchPatient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb">
        <%
            if (session.getAttribute("user") != null) {
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
                            <%                        String searchBy = request.getParameter("searchBy");
                                String searchVal = request.getParameter("searchVal");
                                System.out.println(searchBy);
                                System.out.println(searchVal);

                                SearchPatient sp = new SearchPatient();
                                ArrayList<Patient> plist = new ArrayList<Patient>();

                                if (searchBy.equals("name")) {
                                    plist = sp.getPatientByName(searchVal);
                                } else {
                                    plist = sp.getPatientByNIC(searchVal);
                                }
                                if (!(plist.size() == 0 || plist == null)) {
                                    for (int i = 0; i < plist.size(); i++) {
                            %>
                            <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;margin-top: 20px" >
                                <div class="col-md-3" >
                                    <img src="img/default-user.png" height="100" width="100" style="margin-top: 5px">
                                </div>
                                <div class="col-md-6">
                                    <h3><%=plist.get(i).getFname() + " " + plist.get(i).getLname()%></h3>
                                    <p><%=plist.get(i).getAddress()%></p>
                                    <p><%=plist.get(i).getNic()%></p>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-info" onclick="location.href = 'patientProfile.jsp?patientUserID=<%= plist.get(i).getUserId()%>';" type="button" style="margin-top: 40px;"  >View Profile</button>                                    
                                </div>
                            </div>
                            <%
                                }
                            } else {
                            %>
                            <div class="alert" style="background-color: #ee0f2a">
                                <strong>Sorry!</strong> No Search Results For That Input.
                            </div>

                            <%
                                }
                            %>
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
