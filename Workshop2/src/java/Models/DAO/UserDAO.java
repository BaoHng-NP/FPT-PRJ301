/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Context.DBContext;
import Models.Entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author baohu
 */
public class UserDAO {

    public User Login(String userId, int password) throws Exception {
        User user = null;
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        String fullName;
        int role;

        try {
            cnn = new DBContext().getConnection();
            String sql = "select fullName, role from Users where [userId]=? and [password]=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, userId);
            preStm.setInt(2, password);
            rs = preStm.executeQuery();
            while (rs.next()) {
                fullName = rs.getString(1);
                role = rs.getInt(2);
                user = new User(userId, password, fullName, role);
            }//end while
            return user;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return null;
    }

    public User checkUserExist(String userId) throws Exception {
        String sql = "select * from Users where [userId]=?";
        try {
            Connection cnn=new DBContext().getConnection();
            PreparedStatement preStm=cnn.prepareStatement(sql);
            preStm.setString(1,userId);
            ResultSet rs=preStm.executeQuery();
            while(rs.next()){
                return new User(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getInt(4));
            }
        }catch (Exception e){
            
        }return null;
    }
        public boolean addUser(User user) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = new DBContext().getConnection();
        try {

            String sql = "Insert Users values(?,?,?,?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, user.getUserId());
            preStm.setInt(2, user.getPassword());
            preStm.setString(3, user.getFullName());
            preStm.setInt(4, user.getRole());

            return preStm.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preStm != null) {
                preStm.close();
            }

            if (cnn != null) {
                cnn.close();
            }
        }
        return false;
    }

}
