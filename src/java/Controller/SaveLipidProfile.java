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
public class SaveLipidProfile extends HttpServlet {

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
//            out.println("<title>Servlet SaveLipidProfile</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveLipidProfile at " + request.getContextPath() + "</h1>");
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
        Connection con = DBConnectionHandler.createConnection();
        int patientUserID = Integer.parseInt(request.getParameter("userID"));
        try {
            float total = Float.parseFloat(request.getParameter("total"));
            float hdl = Float.parseFloat(request.getParameter("hdl"));
            float tryglycerides = Float.parseFloat(request.getParameter("tryglycerides"));
            float ldl = Float.parseFloat(request.getParameter("ldl"));
            float vldl = Float.parseFloat(request.getParameter("vldl"));
            float ratio = Float.parseFloat(request.getParameter("ratio"));

            String issued_date = request.getParameter("issued_date");
            int labassisID = Integer.parseInt(request.getParameter("labassisID"));
            System.out.println("lab Assis ID : " + labassisID);
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            System.out.println("patient ID :" + patientID);

            System.out.println("patinet User id : " + patientUserID);

            con.setAutoCommit(false);

            String query = "INSERT into report "
                    + "(patient_patient_id,labassistant_labassistant_id,category,issued_date,flag) "
                    + "VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ps.setInt(2, labassisID);
            ps.setString(3, "lipidprofile");
            ps.setString(4, issued_date);
            ps.setString(5, "1");
            ps.executeUpdate();

            int report_id = 0;

            query = "SELECT MAX(report_id) FROM report";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                report_id = rset.getInt(1);
            }

            query = "INSERT into lipidprofile "
                    + "(cho_total,cho_hdl,triglyverides,cho_ldl,vldl,ratio,report_report_id) "
                    + "VALUES(?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setFloat(1, total);
            ps.setFloat(2, hdl);
            ps.setFloat(3, tryglycerides);
            ps.setFloat(4, ldl);
            ps.setFloat(5, vldl);
            ps.setFloat(6, ratio);
            ps.setFloat(7, report_id);
            ps.executeUpdate();
            con.commit();
            con.close();
            response.sendRedirect("patientProfile.jsp?patientUserID=" + patientUserID + "&msg=success");

        } catch (Exception ex) {
            System.out.println(ex);
            try {
                con.rollback();
                //Logger.getLogger(SaveFullBloodCount.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                System.out.println("Oops something went wrong..!!");
                //response.sendRedirect("patientProfile.jsp?patientUserID=" + patientUserID + "&msg=error");
                //Logger.getLogger(SaveFullBloodCount.class.getName()).log(Level.SEVERE, null, ex1);
            }
            response.sendRedirect("patientProfile.jsp?patientUserID=" + patientUserID + "&msg=error");
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
