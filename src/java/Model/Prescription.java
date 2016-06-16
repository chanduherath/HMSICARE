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
public class Prescription {
    private int prescriptionID;
    private int doctorID;
    private int patientID;
    private String diagnosedWith;
    private float bloodPressure;
    private float pulserate;
    private String drug1;
    private String drug2;
    private String drug3;
    private String drug4;
    private String drug5;
    private String recomendedTest;
    private String thingsToFollow;
    private Date examinedDate;

    public Prescription() {
    }

    public Prescription(int prescriptionID, int doctorID, int patientID, String diagnosedWith, float bloodPressure, float pulserate, String drug1, String drug2, String drug3, String drug4, String drug5, String recomendedTest, String thingsToFollow, Date examinedDate) {
        this.prescriptionID = prescriptionID;
        this.doctorID = doctorID;
        this.patientID = patientID;
        this.diagnosedWith = diagnosedWith;
        this.bloodPressure = bloodPressure;
        this.pulserate = pulserate;
        this.drug1 = drug1;
        this.drug2 = drug2;
        this.drug3 = drug3;
        this.drug4 = drug4;
        this.drug5 = drug5;
        this.recomendedTest = recomendedTest;
        this.thingsToFollow = thingsToFollow;
        this.examinedDate = examinedDate;
    }

    /**
     * @return the prescriptionID
     */
    public int getPrescriptionID() {
        return prescriptionID;
    }

    /**
     * @param prescriptionID the prescriptionID to set
     */
    public void setPrescriptionID(int prescriptionID) {
        this.prescriptionID = prescriptionID;
    }

    /**
     * @return the doctorID
     */
    public int getDoctorID() {
        return doctorID;
    }

    /**
     * @param doctorID the doctorID to set
     */
    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    /**
     * @return the patientID
     */
    public int getPatientID() {
        return patientID;
    }

    /**
     * @param patientID the patientID to set
     */
    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    /**
     * @return the diagnosedWith
     */
    public String getDiagnosedWith() {
        return diagnosedWith;
    }

    /**
     * @param diagnosedWith the diagnosedWith to set
     */
    public void setDiagnosedWith(String diagnosedWith) {
        this.diagnosedWith = diagnosedWith;
    }

    /**
     * @return the bloodPressure
     */
    public float getBloodPressure() {
        return bloodPressure;
    }

    /**
     * @param bloodPressure the bloodPressure to set
     */
    public void setBloodPressure(float bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    /**
     * @return the pulserate
     */
    public float getPulserate() {
        return pulserate;
    }

    /**
     * @param pulserate the pulserate to set
     */
    public void setPulserate(float pulserate) {
        this.pulserate = pulserate;
    }

    /**
     * @return the drug1
     */
    public String getDrug1() {
        return drug1;
    }

    /**
     * @param drug1 the drug1 to set
     */
    public void setDrug1(String drug1) {
        this.drug1 = drug1;
    }

    /**
     * @return the drug2
     */
    public String getDrug2() {
        return drug2;
    }

    /**
     * @param drug2 the drug2 to set
     */
    public void setDrug2(String drug2) {
        this.drug2 = drug2;
    }

    /**
     * @return the drug3
     */
    public String getDrug3() {
        return drug3;
    }

    /**
     * @param drug3 the drug3 to set
     */
    public void setDrug3(String drug3) {
        this.drug3 = drug3;
    }

    /**
     * @return the drug4
     */
    public String getDrug4() {
        return drug4;
    }

    /**
     * @param drug4 the drug4 to set
     */
    public void setDrug4(String drug4) {
        this.drug4 = drug4;
    }

    /**
     * @return the drug5
     */
    public String getDrug5() {
        return drug5;
    }

    /**
     * @param drug5 the drug5 to set
     */
    public void setDrug5(String drug5) {
        this.drug5 = drug5;
    }

    /**
     * @return the recomendedTest
     */
    public String getRecomendedTest() {
        return recomendedTest;
    }

    /**
     * @param recomendedTest the recomendedTest to set
     */
    public void setRecomendedTest(String recomendedTest) {
        this.recomendedTest = recomendedTest;
    }

    /**
     * @return the thingsToFollow
     */
    public String getThingsToFollow() {
        return thingsToFollow;
    }

    /**
     * @param thingsToFollow the thingsToFollow to set
     */
    public void setThingsToFollow(String thingsToFollow) {
        this.thingsToFollow = thingsToFollow;
    }

    /**
     * @return the examinedDate
     */
    public Date getExaminedDate() {
        return examinedDate;
    }

    /**
     * @param examinedDate the examinedDate to set
     */
    public void setExaminedDate(Date examinedDate) {
        this.examinedDate = examinedDate;
    }

   
    
    
}
