/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Doctor;
import Model.LabAssistant;
import Model.Patient;
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
public class UpdateUserDetails extends HttpServlet {

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
//            out.println("<title>Servlet UpdateUserDetails</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateUserDetails at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
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
        //processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        System.out.println("Inside UpdateUserDetails servlet..");
        Connection con = DBConnectionHandler.createConnection();
        //out.println("here we stop");

        try {
            User usr = (User) request.getSession().getAttribute("user");
            String type = request.getParameter("type");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String nic = request.getParameter("nic");
            String address = request.getParameter("address");
            String email = request.getParameter("email");

//        for patients
            String description = request.getParameter("description");
            String wardnumber = request.getParameter("wardnumber");
            String admitteddate = request.getParameter("admitteddate");
            String dischargeddate = request.getParameter("dischargeddate");

//        for doctors
            String doctype = request.getParameter("doctype");
            String hospital = request.getParameter("hospital");

//            for lab Assistants
            String labassistype = request.getParameter("labassistype");

            con.setAutoCommit(false);

            String query = "UPDATE user SET fname=? ,lname=? ,nic=? ,address=? ,email=? WHERE user_id=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, nic);
            ps.setString(4, address);
            ps.setString(5, email);
            ps.setString(6, Integer.toString(usr.getUserId()));
            ps.executeUpdate();

            if (type.equals("Patient")) {
                query = "UPDATE patient SET description=? , ward_number=? , admitted_date=? , discharged_date=? WHERE user_user_id=? ";
                ps = con.prepareStatement(query);
                //ps.setInt(1, userId);
                ps.setString(1, description);
                ps.setInt(2, Integer.parseInt(wardnumber));
                ps.setString(3, admitteddate);
                ps.setString(4, dischargeddate);
                ps.setString(5, Integer.toString(usr.getUserId()));
//                ps.setString(4, dischargeddate);
                System.out.println(ps.toString());
                ps.executeUpdate();
            } else if (type.equals("Doctor")) {
                query = "UPDATE doctor SET field=? , hospital=? WHERE user_user_id=? ";
                ps = con.prepareStatement(query);
                ps.setString(1, doctype);
                ps.setString(2, hospital);
                ps.setString(3, Integer.toString(usr.getUserId()));
                ps.executeUpdate();
            } else if (type.equals("LabAssistant")) {
                query = "UPDATE labassistant SET type=? WHERE user_user_id=? ";
                ps = con.prepareStatement(query);
                ps.setString(1, labassistype);
                ps.setString(2, Integer.toString(usr.getUserId()));
                ps.executeUpdate();
            }
            con.commit();
            con.close();
            if (type.equals("Doctor")) {
                SearchDoctor sd = new SearchDoctor();
                usr = sd.getDoctorByUserID(usr.getUserId());
                request.getSession().setAttribute("user", usr);
                Doctor usr3 = (Doctor) request.getSession().getAttribute("user");
            } else if (type.equals("Patient")) {
                SearchPatient sp = new SearchPatient();
                usr = sp.getPatientByUserID(usr.getUserId());
                request.getSession().setAttribute("user", usr);
                Patient pt = (Patient) request.getSession().getAttribute("user");
            } else if (type.equals("LabAssistant")) {
                SearchLabAssistant la = new SearchLabAssistant();
                usr = la.getLabAssistantByUserID(usr.getUserId());
                request.getSession().setAttribute("user", usr);
                LabAssistant las = (LabAssistant) request.getSession().getAttribute("user");
            } else if (type.equals("admin")) {
                con = DBConnectionHandler.createConnection();
                query = "SELECT * FROM user WHERE user_id=? ";
                ps = con.prepareStatement(query);
                ps.setInt(1, usr.getUserId());
                ResultSet rsetUser = ps.executeQuery();

                if (rsetUser.next()) {//An user exists for that username and password
                    usr = new User(rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9), rsetUser.getBlob(11));
                    request.getSession().setAttribute("user", usr);
                }
            }
            response.sendRedirect("viewProfile.jsp?msg=success");
        } catch (SQLException ex) {
            System.out.println("An Exception occured");
            try {
                con.rollback();
            } catch (SQLException ex1) {
                out.println("Oops.! Something went Wrong.\n");
                out.println(ex1.toString());
                //response.sendRedirect("addUser.jsp?msg=error");
            }
            out.println("Oops.! Something went Wrong.\n");
            System.out.println(ex.toString());
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
