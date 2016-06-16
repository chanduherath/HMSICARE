/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Blob;

/**
 *
 * @author Chandu Herath
 */
public class User {
    
    private int userId;
    private String username; 
    private String userLevel;
    private String fname;
    private String lname;
    private String nic;
    private String address;
    private String email;
    private Blob profpic;
    private Short flag;
    

    public User() {
    }

    public User(int userId, String username,String userLevel, String fname, String lname, String nic, String address, String email) {
        this.userId = userId;
        this.username = username;
        
        this.userLevel = userLevel;
        this.fname = fname;
        this.lname = lname;
        this.nic = nic;
        this.address = address;
        this.email = email;
       
    }

    public User(int userId, String username,String userLevel, String fname, String lname, String nic, String address, String email, Short flag) {
        this.userId = userId;
        this.username = username;      
        this.userLevel = userLevel;
        this.fname = fname;
        this.lname = lname;
        this.nic = nic;
        this.address = address;
        this.email = email;
        this.flag = flag;
    }

    public User(int userId, String username, String userLevel, String fname, String lname, String nic, String address, String email, Blob profpic) {
        this.userId = userId;
        this.username = username;
        this.userLevel = userLevel;
        this.fname = fname;
        this.lname = lname;
        this.nic = nic;
        this.address = address;
        this.email = email;
        this.profpic = profpic;
    }
    
    

    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

 
    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
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
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
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
     * @return the flag
     */
    public Short getFlag() {
        return flag;
    }

    /**
     * @param flag the flag to set
     */
    public void setFlag(Short flag) {
        this.flag = flag;
    }

    /**
     * @return the userLevel
     */
    public String getUserLevel() {
        return userLevel;
    }

    /**
     * @param userLevel the userLevel to set
     */
    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }

    /**
     * @return the profpic
     */
    public Blob getProfpic() {
        return profpic;
    }

    /**
     * @param profpic the profpic to set
     */
    public void setProfpic(Blob profpic) {
        this.profpic = profpic;
    }
    
}
