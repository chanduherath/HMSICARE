/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
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
public class SaveBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SaveBooking</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveBooking at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        
//        response.setContentType("text/html;charset=UTF-8");
        System.out.println("Inside Save Booking servlet");
        Connection con = DBConnectionHandler.createConnection();

        try {

//            String pname = request.getParameter("pname");
//            String telephone = request.getParameter("telephone");
//            String spec = request.getParameter("spec");
//            String nic = request.getParameter("nic");
//            String email = request.getParameter("email");
//            int timeslotID = Integer.parseInt(request.getParameter("timeslotID"));
            String spec = (String) request.getSession().getAttribute("spec");
            System.out.println(spec);
            String pname = (String) request.getSession().getAttribute("pname");          
            System.out.println(pname);
            String telephone = (String) request.getSession().getAttribute("telephone");
            System.out.println(telephone);
            String nic = (String) request.getSession().getAttribute("nic");
             System.out.println(nic);
            String email = (String) request.getSession().getAttribute("email");
            System.out.println(email);
            int timeslotID = (int)request.getSession().getAttribute("timeslotID");            
            System.out.println(timeslotID);

            con.setAutoCommit(false);
            String query = "INSERT INTO externalpatients "
                    + "(name,status,telephone,nic,email,flag) "
                    + "VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, pname);
            ps.setString(2, spec);
            ps.setString(3, telephone);
            ps.setString(4, nic);
            ps.setString(5, email);
            ps.setString(6, "1");

            ps.executeUpdate();

            int userId = 0;
            query = "SELECT MAX(externalpatient_id) FROM externalpatients";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                userId = rset.getInt(1);
            }

            query = "INSERT INTO booking "
                    + "(timeslot_timeslot_id,externalpatients_idexternalpatients,flag) "
                    + "VALUES (?,?,?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, timeslotID);
            ps.setInt(2, userId);
            ps.setString(3, "1");
            ps.executeUpdate();

            con.commit();
            con.close();
            response.sendRedirect("makeBooking.jsp?msg=success");
        } catch (SQLException ex) {
            System.out.println("An Exception occured");
            try {
                con.rollback();
            } catch (SQLException ex1) {
                //response.sendRedirect("makeBooking.jsp?msg=error");
            }
            System.out.println(ex.toString());
            response.sendRedirect("makeBooking.jsp?msg=error");
        }

    }

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
        processRequest(request, response);

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
        processRequest(request, response);

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
