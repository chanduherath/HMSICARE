<%-- 
    Document   : index
    Created on : May 29, 2016, 7:09:26 PM
    Author     : Chandu Herath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMSICARE</title>
        <%@include file="stylesAndScripts.jsp" %>
        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <!-- End WOWSlider.com HEAD section -->
    </head>
    <body style="background-color: #e4ebeb">
        <div>
            <%@include file="header.jsp" %>
        </div>
        <!-- Start WOWSlider.com BODY section -->
        <div id="wowslider-container1" style="margin-top: -20px">
            <div class="ws_images"><ul>
                    <li><img src="data1/images/img2.jpg" alt="" title="" id="wows1_0"/></li>
                    <li><img src="data1/images/img4.jpg" alt="" title="" id="wows1_1"/></li>
                    <li><a href="http://wowslider.com"><img src="data1/images/img1.jpg" alt="bootstrap carousel" title="" id="wows1_2"/></a></li>
                    <li><img src="data1/images/img3.jpg" alt="" title="" id="wows1_3"/></li>
                </ul></div>
            <div class="ws_bullets"><div>
                    <a href="#" title=""><span><img src="data1/tooltips/img2.jpg" alt=""/>1</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/img4.jpg" alt=""/>2</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/img1.jpg" alt=""/>3</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/img3.jpg" alt=""/>4</span></a>
                </div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.com/vi">css slider</a> by WOWSlider.com v8.6</div>
            <div class="ws_shadow"></div>
        </div>

        <div class="container" >
            <div class="row" style="margin-top: 50px">
                <div class="col-md-4" >
                    <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;text-align: center;height: 400px">
                        <img src="img/special-news.jpg" alt="left" width="300" height="200" style="margin-top: 20px">                        
                        <a href="#" ><h3 style="text-align: center;color: #286090;font-family: sans-serif"><b>Specials News</b></h3></a>
                        <div class="col-md-12">
                            <p style="text-align: center">Sethsevana Hospital is celebrating the 5 year service for its patients on 16th June.</p>
                            <p>In line with that the new ward scheme for the hospital will get open by Dr. Anurudda Padeniya.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;text-align: center;height: 400px" >
                        <img src="img/offers.jpg" alt="left" width="300" height="200" style="margin-top: 20px" >    
                        <a href="#" ><h3 style="text-align: center;color: #286090;font-family: sans-serif"><b>Available Offers</b></h3></a>
                        <div class="col-md-12">
                            <p style="text-align: center">An special offer is given for the full body check up package and for the CT scan test.</p>
                            <p>The offer will be valid until the 31st July.15% discount will be given for the all other types of tests.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="col-md-12" style="border-style: solid;background-color: white;border-right: none;border-top: none;border-bottom: none;border-left-color: #286090;text-align: center;height: 400px" >
                        <img src="img/careers.jpg" alt="left" width="300" height="200" style="margin-top: 20px">    
                        <a href="#" ><h3 style="text-align: center;color: #286090;font-family: sans-serif"><b>Our Careers</b></h3></a>
                        <div class="col-md-12">
                            <p style="text-align: center">We provide our people with every opportunity to progress their careers.</p>
                            <p>When you find a role that looks appealing to you please contact us with your resume.</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br>
        <br>
        <div class="container-fluid">
            <div class="col-md-12">
                <h2 style="text-align: center">Our Vision</h2>
            </div>
            <div class="col-md-12">
                <p style="text-align: center">We will define and deliver “Medicine of the Highest Order” and set the standard for compassion and innovation, always placing patients and their families first.</p>
                <p style="text-align: center">We improve the well-being of patients and communities by delivering innovative, compassionate, </p>
                <p style="text-align: center">patient- and family-centered health care, enriched by education, science, and technology.</p>
            </div>
        </div>

        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <!-- End WOWSlider.com BODY section -->
        <div class="col-sm-12">
            <%@include file = "footer.jsp" %>
        </div>
    </body>
</html>
