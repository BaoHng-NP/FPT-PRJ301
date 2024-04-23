/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models.DAO;

import Context.DBContext;
import Models.Entities.Mobile;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author baohu
 */
public class MobileDAO {

    public List<Mobile> getMobileList() throws Exception {
        Connection cnn = new DBContext().getConnection();
        PreparedStatement preStm = null;
        ResultSet rs = null;

        List<Mobile> mobileList = new ArrayList();
        String mobileId, description, mobileName;
        double price;
        int yearOfProduction, quantity;
        boolean notSale;
        try {

            String sql = "select mobileId,description,price,mobileName,yearOfProduction,quantity,notSale from Mobiles";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                mobileId = rs.getString(1);
                mobileName = rs.getString(4);
                yearOfProduction = rs.getInt(5);
                description = rs.getString(2);
                price = rs.getDouble(3);
                quantity = rs.getInt(6);
                notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);

            }
        } catch (Exception ex) {
            throw ex;
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
        if (mobileList.isEmpty()) {
            return null;
        }
        return mobileList;
    }

    public List<Mobile> searchID(String searchValue) throws Exception {
        Connection cnn = new DBContext().getConnection();
        String mobileId;
        String description;
        double price;
        String mobileName;
        int yearOfProduction;
        int quantity;
        boolean notSale;
        List<Mobile> mobileList = new ArrayList();
        try {
            String sql = "select mobileId, mobileName, yearOfProduction, description, price, quantity, notSale from Mobiles\n"
                    + "where mobileId like ?";

            PreparedStatement preStm = cnn.prepareStatement(sql);
            preStm.setString(1, "%" + searchValue + "%");
            
            ResultSet rs = preStm.executeQuery();
            while (rs.next()) {
                mobileId = rs.getString(1);
                mobileName = rs.getString(2);
                yearOfProduction = rs.getInt(3);
                description = rs.getString(4);
                price = rs.getDouble(5);
                quantity = rs.getInt(6);
                notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }//end while
            rs.close();
            preStm.close();
            cnn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if (mobileList.isEmpty()) {
            return null;
        }
        return mobileList;
    }
    public List<Mobile> searchName(String searchValue) throws Exception {
        Connection cnn = new DBContext().getConnection();
        String mobileId;
        String description;
        double price;
        String mobileName;
        int yearOfProduction;
        int quantity;
        boolean notSale;
        List<Mobile> mobileList = new ArrayList();
        try {
            String sql = "select mobileId, mobileName, yearOfProduction, description, price, quantity, notSale from Mobiles\n"
                    + "where mobileName like ?";

            PreparedStatement preStm = cnn.prepareStatement(sql);
            preStm.setString(1, "%" + searchValue + "%");
            
            ResultSet rs = preStm.executeQuery();
            while (rs.next()) {
                mobileId = rs.getString(1);
                mobileName = rs.getString(2);
                yearOfProduction = rs.getInt(3);
                description = rs.getString(4);
                price = rs.getDouble(5);
                quantity = rs.getInt(6);
                notSale = rs.getBoolean(7);
                Mobile mobile = new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale);
                mobileList.add(mobile);
            }//end while
            rs.close();
            preStm.close();
            cnn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if (mobileList.isEmpty()) {
            return null;
        }
        return mobileList;
    }

    public boolean addMobile(Mobile mobile) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = new DBContext().getConnection();
        try {

            String sql = "Insert Mobiles values(?,?,?,?,?,?,?)";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobile.getMobileId());
            preStm.setString(4, mobile.getMobileName());
            preStm.setInt(5, mobile.getYearOfProduction());
            preStm.setString(2, mobile.getDescription());
            preStm.setDouble(3, mobile.getPrice());
            preStm.setInt(6, mobile.getQuantity());
            preStm.setBoolean(7, mobile.isNotSale());
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

    public boolean deleteMobile(String mobileId) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = new DBContext().getConnection();
        try {

            String sql = "delete Mobiles Where mobileId = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobileId);
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

    public boolean updateMobile(Mobile mobile) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = new DBContext().getConnection();
        try {

            String sql = "Update Mobiles Set description = ?, price = ?, quantity = ?, notSale = ?, mobileName=?, yearOfProduction=? Where mobileId = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobile.getDescription());
            preStm.setDouble(2, mobile.getPrice());
            preStm.setInt(3, mobile.getQuantity());
            preStm.setBoolean(4, mobile.isNotSale());
            preStm.setString(5, mobile.getMobileName());
            preStm.setInt(6, mobile.getYearOfProduction());
            preStm.setString(7, mobile.getMobileId());
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
        public void updateMobileQuantity(String mobileId, int quantity) throws Exception {
        PreparedStatement preStm = null;
        Connection cnn = new DBContext().getConnection();
        try {
            
            String sql = "UPDATE Mobiles SET quantity = ? WHERE mobileId = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, quantity);
            preStm.setString(2, mobileId);
            preStm.executeUpdate();
            System.out.println("run");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public Mobile getMobileById(String mobileId) throws Exception {
        Connection cnn = new DBContext().getConnection();
        PreparedStatement preStm = null;
        ResultSet rs = null;
        try {

            String sql = "select * from Mobiles Where mobileId = ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, mobileId);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Mobile mobile = new Mobile();
                mobile.setMobileId(rs.getString(1));
                mobile.setMobileName(rs.getString(4));
                mobile.setYearOfProduction(rs.getInt(5));
                mobile.setDescription(rs.getString(2));
                mobile.setPrice(rs.getDouble(3));
                mobile.setQuantity(rs.getInt(6));
                mobile.setNotSale(rs.getBoolean(7));
                return mobile;
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preStm != null) {
                preStm.close();
            }

            if (cnn != null) {
                cnn.close();
            }

            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    public List<Mobile> searchByPriceRange(double min, double max) throws Exception {
        Connection cnn = new DBContext().getConnection();
        PreparedStatement preStm = null;
        ResultSet rs = null;
        List<Mobile> mobileList = new ArrayList<>();

        try {

            String sql = "SELECT * FROM Mobiles WHERE price BETWEEN ? AND ?";
            preStm = cnn.prepareStatement(sql);
            preStm.setDouble(1, min);
            preStm.setDouble(2, max);
            rs = preStm.executeQuery();
            while (rs.next()) {
                Mobile mobile = new Mobile();
                mobile.setMobileId(rs.getString("mobileId"));
                mobile.setMobileName(rs.getString("mobileName"));
                mobile.setYearOfProduction(rs.getInt("yearOfProduction"));
                mobile.setDescription(rs.getString("description"));
                mobile.setPrice(rs.getDouble("price"));
                mobile.setQuantity(rs.getInt("quantity"));
                mobile.setNotSale(rs.getBoolean("notSale"));
                mobileList.add(mobile);
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            if (preStm != null) {
                preStm.close();
            }

            if (cnn != null) {
                cnn.close();
            }

            if (rs != null) {
                rs.close();
            }
        }
        if (mobileList.isEmpty()) {
            return null;
        }
        return mobileList;
    }

}
