/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Doctor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Chandu Herath
 */
public class SearchDoctor {

    public ArrayList getDoctorByName(String name) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(name.length());
            String query = "SELECT * FROM user WHERE (fname LIKE '%" + name + "%' OR lname LIKE '%" + name + "%') AND user.user_level = 'Doctor' ";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            System.out.println("bbb");
            while (rsetUser.next()) {
                String query1 = "SELECT * from doctor WHERE user_user_id=" + rsetUser.getInt(1) + "";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rsetDoctor = ps1.executeQuery();
                while (rsetDoctor.next()) {
                    Doctor doc = new Doctor(rsetDoctor.getInt(1), rsetDoctor.getString(2), rsetDoctor.getString(3), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                    searchList.add(doc);
                }
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorByNameAndSpec(String name, String spec) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(name.length());
            String query = "SELECT * FROM user JOIN doctor WHERE (fname LIKE '%" + name + "%' OR lname LIKE '%" + name + "%') AND field='" + spec + "' AND user.user_id = doctor.user_user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorByNameAndDate(String name, String date) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(name.length());
            String query = "select * from user join doctor ON user.user_id = doctor.user_user_id JOIN timeslot ON doctor.doctor_id = timeslot.doctor_doctor_id WHERE date ='" + date + "' AND (fname LIKE '%" + name + "%' OR lname LIKE '%" + name + "%') GROUP BY user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorBySpecAndDate(String spec, String date) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();

            String query = "select * from user join doctor ON user.user_id = doctor.user_user_id JOIN timeslot ON doctor.doctor_id = timeslot.doctor_doctor_id WHERE date ='" + date + "' AND field='" + spec + "' GROUP BY user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorBySpec(String spec) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user JOIN doctor WHERE field='" + spec + "' AND user.user_id = doctor.user_user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorByNameAndSpecAndDate(String name, String spec, String date) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            System.out.println(name.length());
            String query = "select * from user join doctor ON user.user_id = doctor.user_user_id JOIN timeslot ON doctor.doctor_id = timeslot.doctor_doctor_id WHERE date ='" + date + "' AND (fname LIKE '%" + name + "%' OR lname LIKE '%" + name + "%') AND field = '" + spec + "' GROUP BY user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList getDoctorByDate(String date) {
        try {
            ArrayList<Doctor> searchList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "select * from user join doctor ON user.user_id = doctor.user_user_id JOIN timeslot ON doctor.doctor_id = timeslot.doctor_doctor_id WHERE date ='" + date + "' GROUP BY user_id";
            System.out.println(query);
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetUser = ps.executeQuery();
            while (rsetUser.next()) {
                Doctor doc = new Doctor(rsetUser.getInt(12), rsetUser.getString(13), rsetUser.getString(14), rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), rsetUser.getString(8), rsetUser.getString(9));
                searchList.add(doc);
            }
            con.close();
            return searchList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public Doctor getDoctorByUserID(int userID) {
        try {
//            Doctor doc = new Doctor();
            Connection con = DBConnectionHandler.createConnection();
            //  String query = "SELECT * FROM doctor WHERE user_user_id=" + userID + "";
            String query = "SELECT * FROM user WHERE user_id=" + userID + "";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetuser = ps.executeQuery();
            while (rsetuser.next()) {
                String query1 = "SELECT * FROM doctor WHERE user_user_id=" + userID + "";
                ps = con.prepareStatement(query1);
                ResultSet rsetdoctor = ps.executeQuery();
                while (rsetdoctor.next()) {
                    System.out.println();
                    Doctor doc = new Doctor(rsetdoctor.getInt(1), rsetdoctor.getString(2), rsetdoctor.getString(3), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
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

    public Doctor getDoctorByDocID(int docID) {
        try {
            Connection con = DBConnectionHandler.createConnection();           
            String query = "SELECT * FROM doctor WHERE doctor_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, docID);
            ResultSet rsetdoctor = ps.executeQuery();
            while (rsetdoctor.next()) {
                String query1 = "SELECT * FROM user WHERE user_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetdoctor.getInt(4));
                ResultSet rsetuser = ps.executeQuery();
                while (rsetuser.next()) {
                    System.out.println();
                    Doctor doc = new Doctor(rsetdoctor.getInt(1), rsetdoctor.getString(2), rsetdoctor.getString(3), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
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
//    public ArrayList<Doctor> getDoctorByNameAndSpec()

//    public static void main(String[] args) {
//        SearchDoctor d = new SearchDoctor();
//        ArrayList<Doctor> lst = d.getDoctorByNameAndSpecAndDate("r", "Physician", "2016-05-28");
//        for (int i = 0; i < lst.size(); i++) {
//            System.out.println(lst.get(i).getFname());
//            System.out.println(lst.get(i).getNic());
//            System.out.println(lst.get(i).getAddress());
//            System.out.println(lst.get(i).getHospital());
//            System.out.println(lst.get(i).getDoc_id());
//        }
//        Doctor doc = d.getDoctorByDocID(7);
//        System.out.println(doc.getFname());
//    }
}
