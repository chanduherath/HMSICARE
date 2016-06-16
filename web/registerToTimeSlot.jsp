<%-- 
    Document   : registerToTimeSlot
    Created on : Jun 13, 2016, 1:02:07 PM
    Author     : Chandu Herath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="stylesAndScripts.jsp" %>
    </head>
    <body style="background-color: #e4ebeb">
        <div>
            <%@include file="header.jsp" %>
        </div>
        <div class="col-md-offset-3 col-md-6" >
            <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                <div style="margin-left: 30px;margin-top: 30px">
                    <%                        int timeslotID = Integer.parseInt(request.getParameter("timeslotID"));
                    %>
                    <form id="formregistertotimeslot" data-toggle="validator" class="form-horizontal" action="RegisterToTimeSlot" method="POST" style="align-items: center">
                        <div class="form-group col-md-12">
                            <label class="col-md-3 control-label">PATIENT'S NAME</label>
                            <div class="col-md-3">
                                <select id="spec" name="spec" class="form-control">
                                    <option value="Mr." selected="" >Mr.</option>
                                    <option value="Mrs.">Mrs.</option>
                                    <option value="Ms.">Ms.</option>                      
                                </select>
                            </div>
                            <div class="col-md-6">
                                <input id = "pname" name = "pname" type = "text" class = "form-control" placeholder = "NAME" required="" pattern="[A-Za-z]+" >
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-3 control-label">PHONE</label>                
                            <div class="col-md-9">
                                <input id = "telephone" name = "telephone" type = "text" class = "form-control" placeholder = "PHONE 07X XXXXXXX" required="" pattern="[0-9]{10}">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-3 control-label">NIC</label>
                            <div class="col-md-9">
                                <input id = "nic" name = "nic" type = "text" class = "form-control" placeholder = "NIC" required="" pattern="[0-9]{9}[A-Za-z]">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="col-md-3 control-label">EMAIL</label>
                            <div class="col-md-9">
                                <input id = "email" name = "email" type = "text" class = "form-control" placeholder = "EMAIL" >
                            </div>
                        </div>
                        <input type="hidden" name="timeslotID" value="<%= timeslotID%>">
                        <button type="submit" class="btn btn-primary center-block">Continue</button>
                        <br>
                    </form> 
                </div>
            </div>
        </div>       
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
        <script>
            $(#loginform).validator();
        </script>
        <!--        <script type="text/javascript">
                    function setsessionvariables() {
                        var spec = document.getElementById('spec').value;
                        var pname = document.getElementById('pname').value; // change here
                        var telephone = document.getElementById('telephone').value;
                        var nic = document.getElementById('nic').value;
                        var email = document.getElementById('email').value;
        
                        if (!(dname == "" && spec == "" && dateOn == "")) {
                            session.setAttribute("spec",spec);
                            session.setAttribute("pname",pname);
                            session.setAttribute("telephone",telephone);
                            session.setAttribute("nic",nic);
                            session.setAttribute("email",email);
        
                        } else
                            alert('Please Enter Search Values');
                    }
                </script>-->
    </body>
</html>
