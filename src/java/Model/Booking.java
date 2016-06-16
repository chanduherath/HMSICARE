/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Chandu Herath
 */
public class Booking {

    private Date dateOn;
    private Time timefrom;
    private Time timeto;
    private String ststus;
    private String patientName;
    private String telephone;
    private String nic;
    private String email;
    private String docName;

    public Booking() {
    }

    public Booking(Date dateOn, Time timefrom, Time timeto, String ststus, String patientName, String telephone, String nic, String email, String docName) {
        this.dateOn = dateOn;
        this.timefrom = timefrom;
        this.timeto = timeto;
        this.ststus = ststus;
        this.patientName = patientName;
        this.telephone = telephone;
        this.nic = nic;
        this.email = email;
        this.docName = docName;
    }

    /**
     * @return the dateOn
     */
    public Date getDateOn() {
        return dateOn;
    }

    /**
     * @param dateOn the dateOn to set
     */
    public void setDateOn(Date dateOn) {
        this.dateOn = dateOn;
    }

    /**
     * @return the timefrom
     */
    public Time getTimefrom() {
        return timefrom;
    }

    /**
     * @param timefrom the timefrom to set
     */
    public void setTimefrom(Time timefrom) {
        this.timefrom = timefrom;
    }

    /**
     * @return the timeto
     */
    public Time getTimeto() {
        return timeto;
    }

    /**
     * @param timeto the timeto to set
     */
    public void setTimeto(Time timeto) {
        this.timeto = timeto;
    }

    /**
     * @return the ststus
     */
    public String getStstus() {
        return ststus;
    }

    /**
     * @param ststus the ststus to set
     */
    public void setStstus(String ststus) {
        this.ststus = ststus;
    }

    /**
     * @return the patientName
     */
    public String getPatientName() {
        return patientName;
    }

    /**
     * @param patientName the patientName to set
     */
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * @return the nic
     */
    public String getNic() {
        return nic;
    }

    /**
     * @param nic the nic to set
     */
    public void setNic(String nic) {
        this.nic = nic;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the docName
     */
    public String getDocName() {
        return docName;
    }

    /**
     * @param docName the docName to set
     */
    public void setDocName(String docName) {
        this.docName = docName;
    }

}
