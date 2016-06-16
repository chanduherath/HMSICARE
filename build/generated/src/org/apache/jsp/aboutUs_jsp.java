package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Model.User;

public final class aboutUs_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/stylesAndScripts.jsp");
    _jspx_dependants.add("/header.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("    </body>\n");
      out.write("</html>-->\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("<link href=\"css/simple-sidebar.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"css/demo.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/footer-distributed-with-address-and-phones.css\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\">\n");
      out.write("<link href=\"http://fonts.googleapis.com/css?family=Cookie\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("<script src=\"js/jquery-1.12.1.min.js\"></script>\n");
      out.write("<script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"js/validator.js\"></script>");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color: #e4ebeb\">\n");
      out.write("        <div>\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("    </body>\n");
      out.write("</html>-->\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("<link href=\"css/simple-sidebar.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"css/demo.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"css/footer-distributed-with-address-and-phones.css\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\">\n");
      out.write("<link href=\"http://fonts.googleapis.com/css?family=Cookie\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("<script src=\"js/jquery-1.12.1.min.js\"></script>\n");
      out.write("<script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("<script src=\"js/validator.js\"></script>");
      out.write("  \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse\" style=\"border-radius: 0;\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#myNavbar\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span> \n");
      out.write("                    </button>\n");
      out.write("                    <!--<a class=\"navbar-brand\" href=\"index.jsp\">SethSevana</a>-->\n");
      out.write("                    <a href=\"#menu-toggle\" class=\"navbar-brand\" id=\"menu-toggle\" style=\"background-image: url(img/sethsevanaLogo.jpg);width: 130px;background-repeat: no-repeat\" ></a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <!--<li class=\"active\"><a href=\"index.jsp\">Home</a></li>-->\n");
      out.write("                        ");

                            HttpSession ses = request.getSession();
                            if (null == ses.getAttribute("user")) {
//                                User us = (User) ses.getAttribute("user");
                        
      out.write(" \n");
      out.write("                        <li><a href=\"index.jsp\">HOME</a></li>\n");
      out.write("                        <li><a href=\"makeBooking.jsp\">ONLINE BOOKING</a></li>\n");
      out.write("                        <li class=\"dropdown\">\n");
      out.write("                            <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">OUR SERVICES\n");
      out.write("                                <span class=\"caret\"></span></a>\n");
      out.write("                            <ul class=\"dropdown-menu\">\n");
      out.write("                                <li><a href=\"#\">LABORATORY REPORTS</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                        <li><a href=\"#\">ABOUT</a></li> \n");
      out.write("                        <li><a href=\"prescription.jsp\">CONTACT</a></li> \n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                    <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                        ");

                            if ((null == ses.getAttribute("user"))) {
                        
      out.write("\n");
      out.write("                        <li><a href=\"login.jsp?msg=success\"><span class=\"glyphicon glyphicon-log-in\"></span> Login</a></li>\n");
      out.write("                            ");

                            } else {
                                User us = (User) ses.getAttribute("user");
                            
      out.write("\n");
      out.write("                        <!--<li><label class=\"center-block\" style=\"color: whitesmoke\">");
      out.print( us.getFname() + us.getLname());
      out.write("</label>></li>-->\n");
      out.write("                        <li><a href=\"#\">");
      out.print( us.getFname() + " " + us.getLname());
      out.write("</a></li>\n");
      out.write("                        <li><a href=\"Signout\"><span class=\"glyphicon glyphicon-log-out\"></span> Logout</a></li>\n");
      out.write("                            ");

                                }
                            
      out.write(" \n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </div> \n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <h3 style=\"color: #3366ff\"><b>About Us<b></h3>\n");
      out.write("                            </div> \n");
      out.write("                            <div class=\"col-md-12\">\n");
      out.write("                                <img src=\"img/aboutUs.jpg\" alt=\"Image in the about us page\" class=\"col-md-6\" style=\"height: 300px \">\n");
      out.write("                                <div class=\"col-md-6\">\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <h4 style=\"color: #3366ff\"><b>Our History</b></h4>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <p style=\"text-align: justify\">Sethsevana Hospitals Corporation Ltd commenced operations in Sri Lanka on 7th June 2002, under the brand name of Apollo Hospitals, a part of the chain of Apollo Hospitals founded by the renown Dr. Pratap C. Reddy in India. As the only purpose built private hospital of its kind in Sri Lanka, Apollo Colombo revolutionised Sri Lanka’s healthcare service offer, and today under the brand Lanka Hospitals, we continue dominate and lead the healthcare sector. Ours is still considered to be the best health care facility in the country.\n");
      out.write("                                            In 2012, we celebrated a decade of excellence in healthcare.  Over the past decade, Lanka Hospitals has revolutionized the healthcare industry in Sri Lanka through infrastructure development and advancement of its’ product and services, through sizeable investments, with a view to deliver healthcare that is on par with global developments in medical technology. </p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            </div>\n");
      out.write("                            </body>\n");
      out.write("                            </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
