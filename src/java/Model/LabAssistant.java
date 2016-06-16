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
public class LabAssistant extends User {
    
    private int lab_assis_id;
    private String type;

    public LabAssistant() {
    }

    public LabAssistant(int lab_assis_id, String type) {
        this.lab_assis_id = lab_assis_id;
        this.type = type;
    }

    public LabAssistant(int lab_assis_id, String type, int userId, String username, String userLevel, String fname, String lname, String nic, String address, String email) {
        super(userId, username, userLevel, fname, lname, nic, address, email);
        this.lab_assis_id = lab_assis_id;
        this.type = type;
    }

    /**
     * @return the lab_assis_id
     */
    public int getLab_assis_id() {
        return lab_assis_id;
    }

    /**
     * @param lab_assis_id the lab_assis_id to set
     */
    public void setLab_assis_id(int lab_assis_id) {
        this.lab_assis_id = lab_assis_id;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
}
