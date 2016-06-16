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
public class SaveUser extends HttpServlet {

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
//            out.println("<title>Servlet SaveUser</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveUser at " + request.getContextPath() + "</h1>");
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
        System.out.println("Inside saveUser servlet..");
        Connection con = DBConnectionHandler.createConnection();
        //out.println("here we stop");

        try {

            String type = request.getParameter("type");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String nic = request.getParameter("nic") + "V";
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String conpassword = request.getParameter("conpassword");

//        for patients
            String description = request.getParameter("description");
            String wardnumber = request.getParameter("wardnumber");
            String admitteddate = request.getParameter("admitteddate");

//        for doctors
            String doctype = request.getParameter("doctype");
            String hospital = request.getParameter("hospital");

//            for lab Assistants
            String labassistype = request.getParameter("labassistype");

            con.setAutoCommit(false);
            String query = "INSERT INTO user "
                    + "(username,password,user_level,fname,lname,nic,address,email,flag) "
                    + "VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, type);
            ps.setString(4, fname);
            ps.setString(5, lname);
            ps.setString(6, nic);
            ps.setString(7, address);
            ps.setString(8, email);
            ps.setString(9, "1");

            ps.executeUpdate();

            int userId = 0;
            query = "SELECT MAX(user_id) FROM user";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                userId = rset.getInt(1);
            }
            if (type.equals("Patient")) {
                query = "INSERT INTO patient "
                        + "(user_user_id,description,ward_number,admitted_date) "
                        + "VALUES (?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.setString(2, description);
                ps.setString(3, wardnumber);
                ps.setString(4, admitteddate);
                ps.executeUpdate();
            } else if (type.equals("Doctor")) {
                query = "INSERT INTO doctor "
                        + "(user_user_id,field,hospital) "
                        + "VALUES (?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.setString(2, doctype);
                ps.setString(3, hospital);
                ps.executeUpdate();
            } else if (type.equals("LabAssistant")) {
                query = "INSERT INTO labassistant "
                        + "(user_user_id,type) "
                        + "VALUES (?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.setString(2, labassistype);
                ps.executeUpdate();
            }else if(type.equals("Receptionist")){
                query = "INSERT INTO receptionist "
                        + "(user_user_id) "
                        + "VALUES (?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ps.executeUpdate();
            }
            con.commit();
            con.close();
            response.sendRedirect("addUser.jsp?msg=success");
        } catch (SQLException ex) {
            System.out.println("An Exception occured");
            try {
                con.rollback();
            } catch (SQLException ex1) {
                out.println("Oops.! Something went Wrong.\n");
                out.println(ex1.toString());

                response.sendRedirect("addUser.jsp?msg=error");
            }
            out.println("Oops.! Something went Wrong.\n");
            System.out.println(ex.toString());
            response.sendRedirect("addUser.jsp?msg=error");
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
