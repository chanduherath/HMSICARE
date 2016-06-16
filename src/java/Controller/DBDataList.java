/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Booking;
import Model.Doctor;
import Model.LabAssistant;
import Model.Prescription;
import Model.TimeSlot;
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
public class DBDataList {

    public ArrayList<Doctor> getDoctorsList() {
        try {
            ArrayList<Doctor> docList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM doctor";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetdoctor = ps.executeQuery();
            while (rsetdoctor.next()) {
                String query1 = "SELECT * from user WHERE user_id=" + rsetdoctor.getInt(4) + "";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rsetuser = ps1.executeQuery();
                while (rsetuser.next()) {
                    Doctor doc = new Doctor(rsetdoctor.getInt(1), rsetdoctor.getString(2), rsetdoctor.getString(3), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    docList.add(doc);
                }
            }
            con.close();
            return docList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public int getDocIDByUserID(int userID) {
        try {
            ArrayList<Doctor> docList = new ArrayList<Doctor>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM doctor WHERE user_user_id=" + userID + "";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetdoctor = ps.executeQuery();
            int docID = -1;
            while (rsetdoctor.next()) {
                docID = rsetdoctor.getInt(1);
            }
            con.close();
            return docID;
        } catch (SQLException ex) {
            System.out.println(ex);
            return -1;
        }
    }

    public ArrayList<LabAssistant> getLabAssistantList() {
        try {
            ArrayList<LabAssistant> labassisList = new ArrayList<LabAssistant>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM labassistant";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet labassistant = ps.executeQuery();
            while (labassistant.next()) {
                String query1 = "SELECT * from user WHERE user_id=" + labassistant.getInt(3) + "";
                PreparedStatement ps1 = con.prepareStatement(query1);
                ResultSet rsetuser = ps1.executeQuery();
                while (rsetuser.next()) {
                    LabAssistant labassis = new LabAssistant(labassistant.getInt(1), labassistant.getString(2), rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    labassisList.add(labassis);
                }
            }
            con.close();
            return labassisList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }

    }

    public ArrayList<TimeSlot> getMyTimeSlots(int docID) {
        try {
            DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
            ArrayList<TimeSlot> timeslotList = new ArrayList<TimeSlot>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM timeslot WHERE doctor_doctor_id=? AND flag='1'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, docID);
            ResultSet rsettimeslot = ps.executeQuery();
            while (rsettimeslot.next()) {
                System.out.println("sanjeewani");
                TimeSlot tsl = new TimeSlot(rsettimeslot.getInt(1),rsettimeslot.getInt(2), rsettimeslot.getDate(3), rsettimeslot.getTime(4), rsettimeslot.getTime(5));
                System.out.print(tsl.getStartTime().getHours());
                System.out.print("  " + tsl.getStartTime().getMinutes());
                System.out.print("  " + tsl.getStartTime().getSeconds());

                timeslotList.add(tsl);
            }
            con.close();
            return timeslotList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public Prescription getPrescriptionByID(int prescriptionID) {
        try {
            DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM prescription WHERE prescription_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, prescriptionID);
            System.out.println("chandu");
            ResultSet rsetPrescription = ps.executeQuery();
            System.out.println("Eranga");

            while (rsetPrescription.next()) {
                System.out.println("sanjeewani");
                Prescription pres = new Prescription(rsetPrescription.getInt(1), rsetPrescription.getInt(2), rsetPrescription.getInt(3), rsetPrescription.getString(4), rsetPrescription.getFloat(5), rsetPrescription.getFloat(6), rsetPrescription.getString(7), rsetPrescription.getString(8), rsetPrescription.getString(9), rsetPrescription.getString(10), rsetPrescription.getString(11), rsetPrescription.getString(12), rsetPrescription.getString(13), rsetPrescription.getDate(14));
                return pres;
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public ArrayList<Prescription> getPrescriptionListByPatientID(int patientID) {
        try {
            ArrayList<Prescription> prescriptionList = new ArrayList<Prescription>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM prescription WHERE patient_patient_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, patientID);
            ResultSet rsetPrescription = ps.executeQuery();
            while (rsetPrescription.next()) {
                Prescription pres = new Prescription(rsetPrescription.getInt(1), rsetPrescription.getInt(2), rsetPrescription.getInt(3), rsetPrescription.getString(4), rsetPrescription.getFloat(5), rsetPrescription.getFloat(6), rsetPrescription.getString(7), rsetPrescription.getString(8), rsetPrescription.getString(9), rsetPrescription.getString(10), rsetPrescription.getString(11), rsetPrescription.getString(12), rsetPrescription.getString(13), rsetPrescription.getDate(14));
                prescriptionList.add(pres);
            }
            con.close();
            return prescriptionList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public ArrayList<Booking> getBookings(){
        try {
            ArrayList<Booking> bookingList = new ArrayList<Booking>();
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT doctor_doctor_id,date,timefrom,timeto,name,status,telephone,nic,email FROM booking JOIN timeslot ON booking.timeslot_timeslot_id=timeslot.timeslot_id INNER join externalpatients ON booking.externalpatients_idexternalpatients= externalpatients.externalpatient_id WHERE booking.flag=1 ORDER BY date;";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetBooking = ps.executeQuery();
            while (rsetBooking.next()) {
                SearchDoctor sd = new SearchDoctor();
                Doctor doc = sd.getDoctorByDocID(Integer.parseInt(rsetBooking.getString(1)));
                Booking pres = new Booking(rsetBooking.getDate(2), rsetBooking.getTime(3), rsetBooking.getTime(4), rsetBooking.getString(6), rsetBooking.getString(5), rsetBooking.getString(7), rsetBooking.getString(8), rsetBooking.getString(9),doc.getFname()+ " " + doc.getLname() );
                bookingList.add(pres);
            }
            con.close();
            return bookingList;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }

    public static void main(String[] args) {
        DBDataList d = new DBDataList();
//        ArrayList<TimeSlot> lst = d.getMyTimeSlots(7);
//        for (int i = 0; i < lst.size(); i++) {
//            System.out.println(lst.get(i).getField());
//            System.out.println(lst.get(i).getFname());
//        }
//        Prescription p = d.getPrescriptionByID(5);
//        System.out.println(p.getThingsToFollow());
//        System.out.println(p.getDiagnosedWith());
//        
        ArrayList<Booking> plist = d.getBookings();
        System.out.println(plist.size());
        System.out.println(plist.get(1).getDocName());
    }
}
