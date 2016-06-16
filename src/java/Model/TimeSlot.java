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
public class TimeSlot {

    private int timeslot_id;
    private int docID;
    private Date ondate;
    private Time startTime;
    private Time endTime;

    public TimeSlot() {
    }
    
    public TimeSlot(int timeslot_id, int docID, Date ondate, Time startTime, Time endTime) {
        this.timeslot_id = timeslot_id;
        this.docID = docID;
        this.ondate = ondate;
        this.startTime = startTime;
        this.endTime = endTime;
    }
  

    /**
     * @return the docID
     */
    public int getDocID() {
        return docID;
    }

    /**
     * @param docID the docID to set
     */
    public void setDocID(int docID) {
        this.docID = docID;
    }

    /**
     * @return the ondate
     */
    public Date getOndate() {
        return ondate;
    }

    /**
     * @param ondate the ondate to set
     */
    public void setOndate(Date ondate) {
        this.ondate = ondate;
    }

    /**
     * @return the startTime
     */
    public Time getStartTime() {
        return startTime;
    }

    /**
     * @param startTime the startTime to set
     */
    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    /**
     * @return the endTime
     */
    public Time getEndTime() {
        return endTime;
    }

    /**
     * @param endTime the endTime to set
     */
    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    /**
     * @return the timeslot_id
     */
    public int getTimeslot_id() {
        return timeslot_id;
    }

    /**
     * @param timeslot_id the timeslot_id to set
     */
    public void setTimeslot_id(int timeslot_id) {
        this.timeslot_id = timeslot_id;
    }
}
