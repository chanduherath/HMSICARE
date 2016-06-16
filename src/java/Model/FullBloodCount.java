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
public class FullBloodCount extends Report{
    
    private int bloodreport_id;
    private float haemoglobin;
    private float rbc;
    private float pvc;
    private float mvc;
    private float mch;
    private float mchc;
    private float rdw_cv;
    private float plateletcount;
    private float wbc;
    private float neutrophils;
    private float lymphocytes;
    private float eosinophil;

    public FullBloodCount() {
    }

    public FullBloodCount(int bloodreport_id, float haemoglobin, float rbc, float pvc, float mvc, float mch, float mchc, float rdw_cv, float plateletcount, float wbc, float neutrophils, float lymphocytes, float eosinophil, int report_id, int patient_id, int labassistant_id, String category, Date issued_date) {
        super(report_id, patient_id, labassistant_id, category, issued_date);
        this.bloodreport_id = bloodreport_id;
        this.haemoglobin = haemoglobin;
        this.rbc = rbc;
        this.pvc = pvc;
        this.mvc = mvc;
        this.mch = mch;
        this.mchc = mchc;
        this.rdw_cv = rdw_cv;
        this.plateletcount = plateletcount;
        this.wbc = wbc;
        this.neutrophils = neutrophils;
        this.lymphocytes = lymphocytes;
        this.eosinophil = eosinophil;
    }

   
    
    

    /**
     * @return the bloodreport_id
     */
    public int getBloodreport_id() {
        return bloodreport_id;
    }

    /**
     * @param bloodreport_id the bloodreport_id to set
     */
    public void setBloodreport_id(int bloodreport_id) {
        this.bloodreport_id = bloodreport_id;
    }

    /**
     * @return the haemoglobin
     */
    public float getHaemoglobin() {
        return haemoglobin;
    }

    /**
     * @param haemoglobin the haemoglobin to set
     */
    public void setHaemoglobin(float haemoglobin) {
        this.haemoglobin = haemoglobin;
    }

    /**
     * @return the rbc
     */
    public float getRbc() {
        return rbc;
    }

    /**
     * @param rbc the rbc to set
     */
    public void setRbc(float rbc) {
        this.rbc = rbc;
    }

    /**
     * @return the pvc
     */
    public float getPvc() {
        return pvc;
    }

    /**
     * @param pvc the pvc to set
     */
    public void setPvc(float pvc) {
        this.pvc = pvc;
    }

    /**
     * @return the mvc
     */
    public float getMvc() {
        return mvc;
    }

    /**
     * @param mvc the mvc to set
     */
    public void setMvc(float mvc) {
        this.mvc = mvc;
    }

    /**
     * @return the mch
     */
    public float getMch() {
        return mch;
    }

    /**
     * @param mch the mch to set
     */
    public void setMch(float mch) {
        this.mch = mch;
    }

    /**
     * @return the mchc
     */
    public float getMchc() {
        return mchc;
    }

    /**
     * @param mchc the mchc to set
     */
    public void setMchc(float mchc) {
        this.mchc = mchc;
    }

    /**
     * @return the rdw_cv
     */
    public float getRdw_cv() {
        return rdw_cv;
    }

    /**
     * @param rdw_cv the rdw_cv to set
     */
    public void setRdw_cv(float rdw_cv) {
        this.rdw_cv = rdw_cv;
    }

    /**
     * @return the plateletcount
     */
    public float getPlateletcount() {
        return plateletcount;
    }

    /**
     * @param plateletcount the plateletcount to set
     */
    public void setPlateletcount(float plateletcount) {
        this.plateletcount = plateletcount;
    }

    /**
     * @return the wbc
     */
    public float getWbc() {
        return wbc;
    }

    /**
     * @param wbc the wbc to set
     */
    public void setWbc(float wbc) {
        this.wbc = wbc;
    }

    /**
     * @return the neutrophils
     */
    public float getNeutrophils() {
        return neutrophils;
    }

    /**
     * @param neutrophils the neutrophils to set
     */
    public void setNeutrophils(float neutrophils) {
        this.neutrophils = neutrophils;
    }

    /**
     * @return the lymphocytes
     */
    public float getLymphocytes() {
        return lymphocytes;
    }

    /**
     * @param lymphocytes the lymphocytes to set
     */
    public void setLymphocytes(float lymphocytes) {
        this.lymphocytes = lymphocytes;
    }

    /**
     * @return the eosinophil
     */
    public float getEosinophil() {
        return eosinophil;
    }

    /**
     * @param eosinophil the eosinophil to set
     */
    public void setEosinophil(float eosinophil) {
        this.eosinophil = eosinophil;
    }
}
