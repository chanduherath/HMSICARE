/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Doctor;
import Model.Patient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Chandu Herath
 */
public class SearchPatient {

    public ArrayList getPatientByName(String name) {
        try {
            ArrayList<Patient> searchList = new ArrayList<Patient>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(name.length());
            String query = "SELECT * FROM user WHERE (fname LIKE '%" + name + "%' OR lname LIKE '%" + name + "%') AND user.user_level = 'Patient' ";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                String query1 = "SELECT * from patient WHERE user_user_id=" + rsetUser.getInt(1) + "";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rsetPatient = ps1.executeQuery();
                while (rsetPatient.next()) {
                    Patient pat = new Patient(rsetPatient.getInt(1), rsetPatient.getString(2), rsetPatient.getInt(3), rsetPatient.getDate(4), rsetPatient.getDate(5), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                    searchList.add(pat);
                }
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }

    }

    public ArrayList getPatientByNIC(String nic) {
        try {
            ArrayList<Patient> searchList = new ArrayList<Patient>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(nic.length());
            String query = "SELECT * FROM user WHERE nic = '" + nic + "' AND user.user_level = 'Patient' ";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                String query1 = "SELECT * from patient WHERE user_user_id=" + rsetUser.getInt(1) + "";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rsetPatient = ps1.executeQuery();
                while (rsetPatient.next()) {
                    Patient pat = new Patient(rsetPatient.getInt(1), rsetPatient.getString(2), rsetPatient.getInt(3), rsetPatient.getDate(4), rsetPatient.getDate(5), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                    searchList.add(pat);
                }
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public Patient getPatientByUserID(int userID) {
        try {
//            Doctor doc = new Doctor();
            Connection con = DBConnectionHandler.createConnection();
            //  String query = "SELECT * FROM doctor WHERE user_user_id=" + userID + "";
            String query = "SELECT * FROM user WHERE user_id=" + userID + "";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetuser = ps.executeQuery();
            while (rsetuser.next()) {
                String query1 = "SELECT * FROM patient WHERE user_user_id=" + userID + "";
                ps = con.prepareStatement(query1);
                ResultSet rsetpatient = ps.executeQuery();
                while (rsetpatient.next()) {
                    System.out.println();
                    Patient doc = new Patient(rsetpatient.getInt(1), rsetpatient.getString(2), rsetpatient.getInt(3), rsetpatient.getDate(4), rsetpatient.getDate(5), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    return doc;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public Patient getPatientByPatientID(int patientID) {
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM patient WHERE patient_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ResultSet rsetPatient = ps.executeQuery();
            while (rsetPatient.next()) {
                String query1 = "SELECT * FROM user WHERE user_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetPatient.getInt(6));
                ResultSet rsetuser = ps.executeQuery();
                while (rsetuser.next()) {
                    System.out.println();
                    Patient ptn = new Patient(rsetPatient.getInt(1), rsetPatient.getString(2), rsetPatient.getInt(3), rsetPatient.getDate(4), rsetPatient.getDate(5), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    return ptn;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
//
//    public static void main(String[] args) {
//        SearchPatient d = new SearchPatient();
//        ArrayList<Patient> lst = d.getPatientByName("ath");
//        for (int i = 0; i < lst.size(); i++) {
//            System.out.println(lst.get(i).getFname());
//            System.out.println(lst.get(i).getDescription());
//            System.out.println(lst.get(i).getNic());
//            System.out.println(lst.get(i).getAddress());
//            System.out.println(lst.get(i).getAdmitted_date());
//            System.out.println(lst.get(i).getDischarged_date());
//        }
//        Patient p = d.getPatientByPatientID(2);
//        System.out.println(p.getFname());
//        System.out.println(p.getDescription());
//    }

}
