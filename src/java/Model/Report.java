/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Chandu Herath
 */
public class Report {
    private int report_id;
    private int patient_id;
    private int labassistant_id;
    private String category;
    private Date issued_date;

    public Report() {
    }
    
    public Report(int report_id, int patient_id, int labassistant_id, String category, Date issued_date) {
        this.report_id = report_id;
        this.patient_id = patient_id;
        this.labassistant_id = labassistant_id;
        this.category = category;
        this.issued_date = issued_date;
    }
    
    /**
     * @return the report_id
     */
    public int getReport_id() {
        return report_id;
    }

    /**
     * @param report_id the report_id to set
     */
    public void setReport_id(int report_id) {
        this.report_id = report_id;
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
     * @return the labassistant_id
     */
    public int getLabassistant_id() {
        return labassistant_id;
    }

    /**
     * @param labassistant_id the labassistant_id to set
     */
    public void setLabassistant_id(int labassistant_id) {
        this.labassistant_id = labassistant_id;
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the issued_date
     */
    public Date getIssued_date() {
        return issued_date;
    }

    /**
     * @param issued_date the issued_date to set
     */
    public void setIssued_date(Date issued_date) {
        this.issued_date = issued_date;
    }
    
    
}
