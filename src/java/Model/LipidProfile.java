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
public class LipidProfile extends Report{
    private int lipid_profile_id;
    private float cho_total;
    private float cho_hdl;
    private float triglyverides;
    private float cho_ldl;
    private float vldl;
    private float ratio;

    public LipidProfile() {
    }

    public LipidProfile(int lipid_profile_id, float cho_total, float cho_hdl, float triglyverides, float cho_ldl, float vldl, float ratio, int report_id, int patient_id, int labassistant_id, String category, Date issued_date) {
        super(report_id, patient_id, labassistant_id, category, issued_date);
        this.lipid_profile_id = lipid_profile_id;
        this.cho_total = cho_total;
        this.cho_hdl = cho_hdl;
        this.triglyverides = triglyverides;
        this.cho_ldl = cho_ldl;
        this.vldl = vldl;
        this.ratio = ratio;
    }

    

    /**
     * @return the lipid_profile_id
     */
    public int getLipid_profile_id() {
        return lipid_profile_id;
    }

    /**
     * @param lipid_profile_id the lipid_profile_id to set
     */
    public void setLipid_profile_id(int lipid_profile_id) {
        this.lipid_profile_id = lipid_profile_id;
    }

    /**
     * @return the cho_total
     */
    public float getCho_total() {
        return cho_total;
    }

    /**
     * @param cho_total the cho_total to set
     */
    public void setCho_total(float cho_total) {
        this.cho_total = cho_total;
    }

    /**
     * @return the cho_hdl
     */
    public float getCho_hdl() {
        return cho_hdl;
    }

    /**
     * @param cho_hdl the cho_hdl to set
     */
    public void setCho_hdl(float cho_hdl) {
        this.cho_hdl = cho_hdl;
    }

    /**
     * @return the triglyverides
     */
    public float getTriglyverides() {
        return triglyverides;
    }

    /**
     * @param triglyverides the triglyverides to set
     */
    public void setTriglyverides(float triglyverides) {
        this.triglyverides = triglyverides;
    }

    /**
     * @return the cho_ldl
     */
    public float getCho_ldl() {
        return cho_ldl;
    }

    /**
     * @param cho_ldl the cho_ldl to set
     */
    public void setCho_ldl(float cho_ldl) {
        this.cho_ldl = cho_ldl;
    }

    /**
     * @return the vldl
     */
    public float getVldl() {
        return vldl;
    }

    /**
     * @param vldl the vldl to set
     */
    public void setVldl(float vldl) {
        this.vldl = vldl;
    }

    /**
     * @return the ratio
     */
    public float getRatio() {
        return ratio;
    }

    /**
     * @param ratio the ratio to set
     */
    public void setRatio(float ratio) {
        this.ratio = ratio;
    }

    
}
