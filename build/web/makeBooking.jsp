<%-- 
    Document   : makeBooking
    Created on : May 31, 2016, 7:44:50 AM
    Author     : Chandu Herath
--%>

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
        <div class="col-md-offset-3 col-md-6">
            <%                if (!(request.getParameter("msg") == null)) {
                    if (request.getParameter("msg").equals("success")) {
            %>
            <div class="alert " style="background-color: #67a05d">
                <strong>Success!</strong> User Booking Successfully Completed.
            </div>
            <%
            } else if (request.getParameter("msg").equals("error")) {
            %>
            <div class="alert" style="background-color: #cc2626">
                <strong>Warning!</strong> Oops..! Something Went Wrong. Please Try Again.
            </div>
            <%
                    }
                }
            %>
            <div class="row" style="background-color: white;margin-bottom: 40px;margin-top: 80px;border-style: solid;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <h2 style="font-family: cursive;text-align: center">Channel Your Doctor. Pay Easy</h2>
            </div>

            <div class="row" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <div style="margin-left: 30px;margin-top: 30px">
                    <form class="form-horizontal" action="" method="POST" style="align-items: center">
                        <div class="form-group col-sm-12">                               
                            <input id = "dname" name = "dname" type = "text" class = "form-control" placeholder = "DOCTOR NAME" >
                        </div>
                        <div class = "form-group col-sm-12">                   
                            <select id="spec" name="spec" class="form-control">
                                <option class=""value="" selected="" disabled="">ANY SPECIALIZATION</option>
                                <option value="Allergy Specialist">Allergy Specialist</option>
                                <option value="Audiologist">Audiologist</option>
                                <option value="Bacteriologist">Bacteriologist</option>
                                <option value="Cardiac Electrophysiologist">Cardiac Electrophysiologist</option>
                                <option value="Cardiologist">Cardiologist </option>
                                <option value="Cardiothoracic Surgeon">Cardiothoracic Surgeon</option>                              
                                <option value="Chest Specilalist">Chest Specialist</option>
                                <option value="Child Psychiatrist">Child Psychiatrist</option>
                                <option value="Consultant Dental Surgeon">Consultant Dental Surgeon</option>
                                <option value="Dental Surgeon">Dental Surgeon</option>
                                <option value="Eye  Surgeon">Eye Surgeon</option>
                                <option value="Neurologist">Neurologist</option>
                                <option value="Orthopaedic Surgeon">Orthopaedic Surgeon</option>
                                <option value="Psychologist">Psychologist</option>
                                <option value="Physician">Physician</option>
                            </select>
                        </div>                   
                        <div class="form-group col-sm-12">     
                            <input id = "dateOn" name = "dateOn" type = "date" class = "form-control" placeholder = "DATE" >
                        </div>
                        <!--<input type="button" class="btn btn-info" onclick="window.location.href = 'login.jsp?name==1';" value="Click here">-->
                        <div class="form-group col-sm-12">
                            <input type="button" class="btn btn-info center-block" onclick="check()" value="SEARCH">
                        </div>
                        <!--                        <div class="form-group col-sm-12">
                                                    <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-primary btn-lg center-block">Search</button>
                                                </div>-->
                    </form> 
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function check() {
                var dname = document.getElementById('dname').value; // change here
                var spec = document.getElementById('spec').value;
                var dateOn = document.getElementById('dateOn').value;
                if (!(dname == "" && spec == "" && dateOn == "")) {
//                    alert("chandu");
                    window.location.href = "searchDoctor.jsp?docName=" + dname + "&spec=" + spec + "&date=" + dateOn;
//                    alert("eranga");
                } else
                    alert('Please Enter Search Values');
            }
        </script>
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
