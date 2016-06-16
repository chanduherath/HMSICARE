<%-- 
    Document   : searchDoctor
    Created on : May 31, 2016, 7:52:53 AM
    Author     : Chandu Herath
--%>

<%@page import="Controller.SearchDoctor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Doctor"%>
<%@page import="Model.Doctor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb"> 
        <div>
            <%@include file="header.jsp" %>
        </div>
        <%            String docName = request.getParameter("docName");
            String spec = request.getParameter("spec");
            String date = request.getParameter("date");
//            out.println(docName);
//            out.println(spec);
//            out.println(date);
            ArrayList<Doctor> doclist = new ArrayList<Doctor>();
            SearchDoctor sd = new SearchDoctor();
            if (docName.equals("") && spec.equals("") && date.equals("")) {
                out.println("Sorry please Enter search values");
            } else if (!docName.equals("") && spec.equals("") && date.equals("")) {
                doclist = sd.getDoctorByName(docName);
            } else if (docName.equals("") && !spec.equals("") && date.equals("")) {
                doclist = sd.getDoctorBySpec(spec);
            } else if (docName.equals("") && spec.equals("") && !date.equals("")) {
                doclist = sd.getDoctorByDate(date);
            } else if (!docName.equals("") && !spec.equals("") && date.equals("")) {
                doclist = sd.getDoctorByNameAndSpec(docName, spec);
            } else if (!docName.equals("") && spec.equals("") && !date.equals("")) {
                doclist = sd.getDoctorByNameAndDate(docName, date);
            } else if (docName.equals("") && !spec.equals("") && !date.equals("")) {
                doclist = sd.getDoctorBySpecAndDate(spec, date);
            } else if (!docName.equals("") && !spec.equals("") && !date.equals("")) {
                doclist = sd.getDoctorByNameAndSpecAndDate(docName, spec, date);
            }

        %>

        <div class="row" style="height: 400px">
            <div class="col-md-offset-3 col-md-6">
                <%                    if (!(doclist == null || doclist.size() == 0)) {
                        for (int i = 0; i < doclist.size(); i++) {
                %>

                <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;margin-top: 20px" >
                    <div class="col-md-3" >
                        <img src="img/default-user.png" height="100" width="100" style="margin-top: 5px">
                    </div>
                    <div class="col-md-6">
                        <h3><%= doclist.get(i).getFname() + "  " + doclist.get(i).getLname()%></h3>
                        <h4><%= doclist.get(i).getField()%></h4>
                        <p><%= doclist.get(i).getHospital()%></p>
                    </div>
                    <div class="col-md-3">
                        <!--<button class="btn btn-info" type="button" style="margin-top: 40px;margin-left: 60px" >Channel</button>-->
                        <a href="viewTimeSlots.jsp?docID=<%= doclist.get(i).getDoc_id()%>" class="btn btn-info" style="margin-top: 40px;margin-left: 60px">Channel</a>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="alert alert-danger">
                    <strong>Sorry!</strong> No Search Results For That Input.
                </div>

                <%
                    }
                %>
            </div>
        </div>
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
