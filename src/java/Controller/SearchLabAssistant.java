/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.LabAssistant;
import Model.Patient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Chandu Herath
 */
public class SearchLabAssistant {
    public LabAssistant getLabAssistantByUserID(int userID) {
        try {
//            Doctor doc = new Doctor();
//            System.out.println("startt");
            Connection con = DBConnectionHandler.createConnection();
            //  String query = "SELECT * FROM doctor WHERE user_user_id=" + userID + "";
            String query = "SELECT * FROM user WHERE user_id=" + userID + "";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetuser = ps.executeQuery();
//            System.out.println("stage 2");
            while (rsetuser.next()) {
//                System.out.println("stage 3");
                String query1 = "SELECT * FROM labassistant WHERE user_user_id=" + userID + "";
                ps = con.prepareStatement(query1);
                ResultSet rsetlabassistant = ps.executeQuery();
//                System.out.println("stage 4");
                while (rsetlabassistant.next()) {
//                    System.out.println("ppppppppppppppppppp");
                    System.out.println();
                    LabAssistant labAssis = new LabAssistant(rsetlabassistant.getInt(1), rsetlabassistant.getString(2),rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    return labAssis;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
    
    public LabAssistant getLabAssistantByLabAssistantID(int labassisID) {
        try {
            System.out.println("startt");
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM labassistant WHERE labassistant_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, labassisID);
            ResultSet rsetlabAssistant = ps.executeQuery();
            System.out.println("stage 2");
            while (rsetlabAssistant.next()) {
                System.out.println("stage 3");
                String query1 = "SELECT * FROM user WHERE user_id=?";
                ps = con.prepareStatement(query1);
                ps.setInt(1, rsetlabAssistant.getInt(3));
                ResultSet rsetuser = ps.executeQuery();
                System.out.println("stage 4");
                while (rsetuser.next()) {
                    System.out.println("ppppppppppppppppppp");
                    System.out.println();
                    LabAssistant labAssis = new LabAssistant(rsetlabAssistant.getInt(1), rsetlabAssistant.getString(2),rsetuser.getInt(1), rsetuser.getString(2), rsetuser.getString(4), rsetuser.getString(5), rsetuser.getString(6), rsetuser.getString(7), rsetuser.getString(8), rsetuser.getString(9));
                    return labAssis;
                }
            }
            con.close();
            return null;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }
    }
}
