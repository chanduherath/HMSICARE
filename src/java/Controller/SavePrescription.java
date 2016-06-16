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
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chandu Herath
 */
public class SavePrescription extends HttpServlet {

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
//            out.println("<title>Servlet SavePrescription</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SavePrescription at " + request.getContextPath() + "</h1>");
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

        String diagnosed = request.getParameter("diagnosed");
        String pressure = request.getParameter("pressure");
        String pulseRate = request.getParameter("pulseRate");
        String drug1 = " ";
        String unit1 = " ";
        String dosage1 = " ";

        String drug2 = " ";
        String unit2 = " ";
        String dosage2 = " ";

        String drug3 = " ";
        String unit3 = " ";
        String dosage3 = " ";

        String drug4 = " ";
        String unit4 = " ";
        String dosage4 = " ";

        String drug5 = " ";
        String unit5 = " ";
        String dosage5 = " ";

        if (!request.getParameter("drug1").equals("")) {
            drug1 = request.getParameter("drug1");
        }
        if (!request.getParameter("unit1").equals("")) {
            unit1 = request.getParameter("unit1");
        }
        if (!request.getParameter("dosage1").equals("")) {
            dosage1 = request.getParameter("dosage1");
        }
        if (!request.getParameter("drug2").equals("")) {
            drug2 = request.getParameter("drug2");
        }
        if (!request.getParameter("unit2").equals("")) {
            unit2 = request.getParameter("unit2");
        }
        if (!request.getParameter("dosage2").equals("")) {
            dosage2 = request.getParameter("dosage2");
        }

        if (!request.getParameter("drug3").equals("")) {
            drug3 = request.getParameter("drug3");
        }
        if (!request.getParameter("unit3").equals("")) {
            unit3 = request.getParameter("unit3");
        }
        if (!request.getParameter("dosage3").equals("")) {
            dosage3 = request.getParameter("dosage3");
        }

        if (!request.getParameter("drug4").equals("")) {
            drug4 = request.getParameter("drug4");
        }
        if (!request.getParameter("unit4").equals("")) {
            unit4 = request.getParameter("unit4");
        }
        if (!request.getParameter("dosage4").equals("")) {
            dosage4 = request.getParameter("dosage4");
        }

        if (!request.getParameter("drug5").equals("")) {
            drug5 = request.getParameter("drug5");
        }
        if (!request.getParameter("unit5").equals("")) {
            unit5 = request.getParameter("unit5");
        }
        if (!request.getParameter("dosage5").equals("")) {
            dosage5 = request.getParameter("dosage5");
        }

        String drug1all = drug1 + "/" + unit1 + "/" + dosage1;
        String drug2all = drug2 + "/" + unit2 + "/" + dosage2;
        String drug3all = drug3 + "/" + unit3 + "/" + dosage3;
        String drug4all = drug4 + "/" + unit4 + "/" + dosage4;
        String drug5all = drug5 + "/" + unit5 + "/" + dosage5;

        String anytest = request.getParameter("tests");
        String thingstofollow = request.getParameter("follow");
        String date = request.getParameter("date");

        int docID = Integer.parseInt(request.getParameter("docID"));
        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int patientUserID = Integer.parseInt(request.getParameter("userID"));

        System.out.println(diagnosed);
        System.out.println(pressure);
        System.out.println(pulseRate);
        System.out.println(drug1all);
        System.out.println(drug2all);
        System.out.println(drug3all);
        System.out.println(drug4all);
        System.out.println(drug5all);
        System.out.println(anytest);
        System.out.println(thingstofollow);
        System.out.println(date);

        try {
            con.setAutoCommit(false);
            String query = "INSERT INTO prescription "
                    + "(doctor_doctor_id,patient_patient_id,diagnosedwith,bloodpressure,pulserate,drug1,drug2,drug3,drug4,drug5,anytests,thingstofollow,date) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, docID);
            ps.setInt(2, patientID);
            ps.setString(3, diagnosed);
            ps.setString(4, pressure);
            ps.setString(5, pulseRate);
            ps.setString(6, drug1all);
            ps.setString(7, drug2all);
            ps.setString(8, drug3all);
            ps.setString(9, drug4all);
            ps.setString(10, drug5all);
            ps.setString(11, anytest);
            ps.setString(12, thingstofollow);
            ps.setString(13, date);
            ps.executeUpdate();

            con.commit();
            con.close();
            response.sendRedirect("patientProfile.jsp?patientUserID=" + patientUserID + "&msg=success");

        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Oops..!! something went wrong.");
            try {
                con.rollback();
                //Logger.getLogger(SavePrescription.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex1) {
                System.out.println(ex1);
                System.out.println("Oops..!! something went wrong.");
                //Logger.getLogger(SavePrescription.class.getName()).log(Level.SEVERE, null, ex1);
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
