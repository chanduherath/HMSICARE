<%-- 
    Document   : login
    Created on : May 30, 2016, 1:23:41 PM
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
        <div class="container-fluid" style="left: 0px; right: 0px">
            <div class="col-md-offset-4 col-md-4">

                <%                    if (request.getParameter("msg") != null) {
                        if (request.getParameter("msg").equals("error")) {
                %>
                <div class="alert alert-danger">
                    <strong>Warning!</strong> Oops..! Something Went Wrong. Please Try Again.
                </div>
                <%
                } else if (request.getParameter("msg").equals("incorrect")) {
                %>
                <div class="alert alert-danger">
                    <strong>Warning!</strong> Username or password incorrect.Please Try Again
                </div>
                <%
                        }
                    }
                %>

                <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090" >
                    <img src="img/clipart.jpg"  alt="Login Image" width="200" height="200" class="center-block" style="border-radius: 50%;border-style: solid;border-width: 10px;margin-top: 30px"> 
                    <div style="margin-left: 30px;margin-top: 30px">
                        <form id="loginform" data-toggle="validator" class="form-horizontal" action="Signin" method="POST" style="align-items: center">
                            <div class="form-group col-sm-12">                               
                                <input type="text" class="form-control" name="username" placeholder="USERNAME" pattern="[A-Za-z]+" required="" >
                            </div>                                              
                            <div class="form-group col-sm-12">     
                                <input type="password" class="form-control" name="password" placeholder="ENTER PASSWORD"  required="">
                            </div>             
                            <div class="form-group col-sm-12">
                                <button type="submit" class="btn btn-primary center-block">SIGN IN</button>
                            </div>
                        </form> 
                        <a style="color: #204d74;font-family: monospace;margin-left: 80px">Reset Your Password</a>
                        <br>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(#loginform).validator();
        </script>
        <div>
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
