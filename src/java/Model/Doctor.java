/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Chandu Herath
 */
public class Doctor extends User {
    
    private int doc_id;
    private String field;
    private String hospital;
    
    public Doctor(){
        
    }

    public Doctor(int doc_id, String field, String hospital) {
        this.doc_id = doc_id;
        this.field = field;
        this.hospital = hospital;
    }

    public Doctor(int doc_id, String field, String hospital, int userId, String username,String userLevel, String fname, String lname, String nic, String address, String email) {
        super(userId, username,userLevel, fname, lname, nic, address, email);
        this.doc_id = doc_id;
        this.field = field;
        this.hospital = hospital;
    }
    
    

    /**
     * @return the doc_id
     */
    public int getDoc_id() {
        return doc_id;
    }

    /**
     * @param doc_id the doc_id to set
     */
    public void setDoc_id(int doc_id) {
        this.doc_id = doc_id;
    }

    /**
     * @return the field
     */
    public String getField() {
        return field;
    }

    /**
     * @param field the field to set
     */
    public void setField(String field) {
        this.field = field;
    }

    /**
     * @return the hospital
     */
    public String getHospital() {
        return hospital;
    }

    /**
     * @param hospital the hospital to set
     */
    public void setHospital(String hospital) {
        this.hospital = hospital;
    }
    
}
