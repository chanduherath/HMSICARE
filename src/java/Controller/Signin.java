/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.LabAssistant;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chandu Herath
 */
public class Signin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Signin</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Signin at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.write("Inside sign in servlet..");
        String un = request.getParameter("username");
        String pw = request.getParameter("password");

        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user WHERE username=? AND password=?";
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setString(1, un);
            ps.setString(2, pw);
            ResultSet rsetUser = ps.executeQuery();

            if (rsetUser.next()) {//An user exists for that username and password
                User user;
                if(rsetUser.getString(4).equals("Doctor")){
                    System.out.println("identified as a Doctor");
                    SearchDoctor sd = new SearchDoctor();
                    user = sd.getDoctorByUserID(rsetUser.getInt(1));
                    System.out.println("Created a Doctor Object");
                }else if(rsetUser.getString(4).equals("Patient")){
                    System.out.println("identified as a Patient");
                    SearchPatient sp = new SearchPatient();
                    user = sp.getPatientByUserID(rsetUser.getInt(1));
                    System.out.println("Ctreated a  Paatient Object");
                }else if(rsetUser.getString(4).equals("LabAssistant")){
                    System.out.println("Identified as Lab Assistant");
                    SearchLabAssistant sl = new SearchLabAssistant();
                    user = sl.getLabAssistantByUserID(rsetUser.getInt(1));
                }else{
                    user = new User(rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9), rsetUser.getBlob(11));
                }
                System.out.println("calling upto here");
                if(user == null){
                    System.out.println("What the hell");
                }
                request.getSession().invalidate();
                request.getSession().setAttribute("user", user);
                response.sendRedirect("userHome.jsp");
            }else{
                response.sendRedirect("login.jsp?msg=incorrect");
            }
        } catch (SQLException ex) {
            out.println("Oops! Something went wrong.\n");
            out.println(ex.toString());
            response.sendRedirect("login.jsp?msg=error");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
