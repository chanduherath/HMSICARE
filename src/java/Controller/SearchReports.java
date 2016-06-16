/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.FullBloodCount;
import Model.LipidProfile;
import Model.Prescription;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author Chandu Herath
 */
public class SearchReports {

    public ArrayList<FullBloodCount> getFullBloodCountListByPatientID(int patientID) {
        try {
            ArrayList<FullBloodCount> bloodcountlist = new ArrayList<FullBloodCount>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM report WHERE patient_patient_id=? AND category=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ps.setString(2, "fullbloodcount");
            ResultSet rsetreport = ps.executeQuery();
            while (rsetreport.next()) {
                String query1 = "SELECT * FROM fullbloodcount WHERE report_report_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetreport.getInt(1));
                ResultSet rsetfullbloodcount = ps.executeQuery();
                while (rsetfullbloodcount.next()) {
                    FullBloodCount blcnt = new FullBloodCount(rsetfullbloodcount.getInt(1), rsetfullbloodcount.getFloat(2), rsetfullbloodcount.getFloat(3), rsetfullbloodcount.getFloat(4), rsetfullbloodcount.getFloat(5), rsetfullbloodcount.getFloat(6), rsetfullbloodcount.getFloat(7), rsetfullbloodcount.getFloat(8), rsetfullbloodcount.getFloat(9), rsetfullbloodcount.getFloat(10), rsetfullbloodcount.getFloat(11), rsetfullbloodcount.getFloat(12), rsetfullbloodcount.getFloat(13), rsetreport.getInt(1), rsetreport.getInt(2), rsetreport.getInt(3), rsetreport.getString(4),rsetreport.getDate(5));
                    bloodcountlist.add(blcnt);
                }
            }
            con.close();
            return bloodcountlist;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public ArrayList<LipidProfile> getLipidProfileByPatientID(int patientID) {
        try {
            ArrayList<LipidProfile> lipidprofilelist = new ArrayList<LipidProfile>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM report WHERE patient_patient_id=? AND category=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ps.setString(2, "lipidprofile");
            ResultSet rsetreport = ps.executeQuery();
            while (rsetreport.next()) {
                String query1 = "SELECT * FROM lipidprofile WHERE report_report_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetreport.getInt(1));
                ResultSet rsetlipidprofile = ps.executeQuery();
                while (rsetlipidprofile.next()) {
                    LipidProfile lpd = new LipidProfile(rsetlipidprofile.getInt(1), rsetlipidprofile.getFloat(2), rsetlipidprofile.getFloat(3), rsetlipidprofile.getFloat(4), rsetlipidprofile.getFloat(5), rsetlipidprofile.getFloat(6), rsetlipidprofile.getFloat(7), rsetreport.getInt(1), rsetreport.getInt(2), rsetreport.getInt(3), rsetreport.getString(4),rsetreport.getDate(5));
                    lipidprofilelist.add(lpd);
                }
            }
            con.close();
            return lipidprofilelist;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public FullBloodCount getFullBloodCountByID(int fullbloodcountID) {
        try {
            DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM fullbloodcount WHERE fullbloodcount_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, fullbloodcountID);
            ResultSet rsetfullbloodcount = ps.executeQuery();
            while (rsetfullbloodcount.next()) {
                System.out.println("bbb");
                String query1 = "SELECT * FROM report WHERE report_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetfullbloodcount.getInt(14));
                ResultSet rsetreport = ps.executeQuery();
                while (rsetreport.next()) {
                    FullBloodCount blcnt = new FullBloodCount(rsetfullbloodcount.getInt(1), rsetfullbloodcount.getFloat(2), rsetfullbloodcount.getFloat(3), rsetfullbloodcount.getFloat(4), rsetfullbloodcount.getFloat(5), rsetfullbloodcount.getFloat(6), rsetfullbloodcount.getFloat(7), rsetfullbloodcount.getFloat(8), rsetfullbloodcount.getFloat(9), rsetfullbloodcount.getFloat(10), rsetfullbloodcount.getFloat(11), rsetfullbloodcount.getFloat(12), rsetfullbloodcount.getFloat(13), rsetreport.getInt(1), rsetreport.getInt(2), rsetreport.getInt(3), rsetreport.getString(4),rsetreport.getDate(5));
                    return blcnt;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public LipidProfile getLipidProfileByID(int lipidprofileID) {
        try {
            DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM lipidprofile WHERE lipidprofile_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, lipidprofileID);
            ResultSet rsetlipidprofile = ps.executeQuery();
            while (rsetlipidprofile.next()) {
                String query1 = "SELECT * FROM report WHERE report_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetlipidprofile.getInt(8));
                ResultSet rsetreport = ps.executeQuery();
                while (rsetreport.next()) {
                    LipidProfile lpd = new LipidProfile(rsetlipidprofile.getInt(1), rsetlipidprofile.getFloat(2), rsetlipidprofile.getFloat(3), rsetlipidprofile.getFloat(4), rsetlipidprofile.getFloat(5), rsetlipidprofile.getFloat(6), rsetlipidprofile.getFloat(7), rsetreport.getInt(1), rsetreport.getInt(2), rsetreport.getInt(3), rsetreport.getString(4),rsetreport.getDate(5));
                    return lpd;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public static void main(String[] args) {
        SearchReports sr = new SearchReports();
//        ArrayList<LipidProfile> lp = sr.getLipidProfileByPatientID(1);
//        System.out.println(lp.size());
//        for (int i = 0; i < lp.size(); i++) {
//            System.out.println(lp.get(i).getRatio());
//        }
        System.out.println(sr.getLipidProfileByID(1).getCho_total());
    }
}
