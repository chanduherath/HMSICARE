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
public class SaveFullBloodCount extends HttpServlet {

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
//            out.println("<title>Servlet SaveFullBloodCount</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SaveFullBloodCount at " + request.getContextPath() + "</h1>");
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
        Connection con = DBConnectionHandler.createConnection();
        System.out.println("chanduuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");
        int patientUserID = Integer.parseInt(request.getParameter("userID"));
        try {
            float haemoglobin = Float.parseFloat(request.getParameter("haemoglobin"));
            float rbc = Float.parseFloat(request.getParameter("rbc"));
            float pcv = Float.parseFloat(request.getParameter("pcv"));
            float mcv = Float.parseFloat(request.getParameter("mcv"));
            float mch = Float.parseFloat(request.getParameter("mch"));
            float mchc = Float.parseFloat(request.getParameter("mchc"));
            float rdwcv = Float.parseFloat(request.getParameter("rdwcv"));
            float platelet = Float.parseFloat(request.getParameter("platelet"));
            float wbc = Float.parseFloat(request.getParameter("wbc"));
            float neutrophils = Float.parseFloat(request.getParameter("neutrophils"));
            float lymphocytes = Float.parseFloat(request.getParameter("lymphocytes"));
            float eosinophils = Float.parseFloat(request.getParameter("eosinophils"));

            String issued_date = request.getParameter("issued_date");
            int labassisID = Integer.parseInt(request.getParameter("labassisID"));
            System.out.println("lab Assis ID : " + labassisID);
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            System.out.println("patient ID :" + patientID);

            System.out.println("patinet User id : " + patientUserID);

            System.out.println(haemoglobin);
            System.out.println(rbc);
            System.out.println(pcv);
            System.out.println(mcv);
            System.out.println(mch);
            System.out.println(mchc);
            System.out.println(rdwcv);
            System.out.println(platelet);
            System.out.println(wbc);
            System.out.println(neutrophils);
            System.out.println(lymphocytes);
            System.out.println(eosinophils);

            con.setAutoCommit(false);

            String query = "INSERT into report "
                    + "(patient_patient_id,labassistant_labassistant_id,category,issued_date,flag) "
                    + "VALUES(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ps.setInt(2, labassisID);
            ps.setString(3, "fullbloodcount");
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

            query = "INSERT into fullbloodcount "
                    + "(haemoglobin,rbc,pcv,mcv,mch,mchc,rdwcv,plateletcount,wbc,neutrophils,lymphocytes,eosinophil,report_report_id) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setFloat(1, haemoglobin);
            ps.setFloat(2, rbc);
            ps.setFloat(3, pcv);
            ps.setFloat(4, mcv);
            ps.setFloat(5, mch);
            ps.setFloat(6, mchc);
            ps.setFloat(7, rdwcv);
            ps.setFloat(8, platelet);
            ps.setFloat(9, wbc);
            ps.setFloat(10, neutrophils);
            ps.setFloat(11, lymphocytes);
            ps.setFloat(12, eosinophils);
            ps.setInt(13, report_id);
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
                //Logger.getLogger(SaveFullBloodCount.class.getName()).log(Level.SEVERE, null, ex1);              
                //response.sendRedirect("patientProfile.jsp?patientUserID=" + patientUserID + "&msg=error");
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
