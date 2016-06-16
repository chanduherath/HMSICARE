/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Chandu Herath
 */
public class Patient extends User {
    
    private int patient_id;
    private String description;
    private int ward_number;
    private Date admitted_date;
    private Date discharged_date;

    public Patient() {
    }

    public Patient(int patient_id, String description, int ward_number, Date admitted_date, Date discharged_date) {
        this.patient_id = patient_id;
        this.description = description;
        this.ward_number = ward_number;
        this.admitted_date = admitted_date;
        this.discharged_date = discharged_date;
    }

    public Patient(int patient_id, String description, int ward_number, Date admitted_date, Date discharged_date, int userId, String username,String userLevel, String fname, String lname, String nic, String address, String email) {
        super(userId, username,userLevel, fname, lname, nic, address, email);
        this.patient_id = patient_id;
        this.description = description;
        this.ward_number = ward_number;
        this.admitted_date = admitted_date;
        this.discharged_date = discharged_date;
    }

    /**
     * @return the patient_id
     */
    public int getPatient_id() {
        return patient_id;
    }

    /**
     * @param patient_id the patient_id to set
     */
    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the ward_number
     */
    public int getWard_number() {
        return ward_number;
    }

    /**
     * @param ward_number the ward_number to set
     */
    public void setWard_number(int ward_number) {
        this.ward_number = ward_number;
    }

    /**
     * @return the admitted_date
     */
    public Date getAdmitted_date() {
        return admitted_date;
    }

    /**
     * @param admitted_date the admitted_date to set
     */
    public void setAdmitted_date(Date admitted_date) {
        this.admitted_date = admitted_date;
    }

    /**
     * @return the discharged_date
     */
    public Date getDischarged_date() {
        return discharged_date;
    }

    /**
     * @param discharged_date the discharged_date to set
     */
    public void setDischarged_date(Date discharged_date) {
        this.discharged_date = discharged_date;
    }

}
