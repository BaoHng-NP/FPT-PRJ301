/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author baohu
 */
public class CarsDAO {

    public static Connection getConnection() throws Exception {
        Connection cnn;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionString ="jdbc:sqlserver://localhost:1433;database=MyStock";
            cnn = DriverManager.getConnection(connectionString,"sa", "12345");
            return cnn;
        } catch (ClassNotFoundException | SQLException ex) {
            throw ex;
        }
    }

    public List<Car> getCars() throws Exception {
        List<Car> carList = new ArrayList();

        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;

        try {
            cnn = getConnection();
            String sql = "select carID,carName,manufacturer,price,releasedYear from Cars";
            preStm = cnn.prepareStatement(sql);
            rs = preStm.executeQuery();

            while (rs.next()) {
                int carID = rs.getInt(1);
                String carName = rs.getString(2);
                String manufacturer = rs.getString(3);
                double price = rs.getDouble(4);
                int releasedYear = rs.getInt(5);
                Car car = new Car(carID, carName, manufacturer, price, releasedYear);
                carList.add(car);
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
        if (carList.isEmpty()) {
            return null;
        }

        return carList;
    }

    public boolean addCar(Car car) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        try {
            cnn = getConnection();
            String sql = "Insert Cars values(?,?,?,?,?);";
            preStm = cnn.prepareStatement(sql);
            preStm.setInt(1, car.getCarID());
            preStm.setString(2, car.getCarName());
            preStm.setString(3, car.getManufacturer());
            preStm.setDouble(4, car.getPrice());
            preStm.setInt(5, car.getReleasedYear());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }
    
        public boolean deleteCar(String carId) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        try {
            cnn = getConnection();
            String sql = "Delete Cars Where carID=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, carId);
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }
    public Car getCarById(String carIDstr) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        Car car = null;
        String carName, manufacturer;
        int carID, releasedYear;
        double price;
        try {
            cnn = getConnection();
            String sql = "select carName,manufacturer,price,releasedYear from Cars where [carID]=?";
           preStm = cnn.prepareStatement(sql);
           preStm.setString(1, carIDstr);
            rs = preStm.executeQuery();
            carID=Integer.parseInt(carIDstr);
        while (rs.next()) {
                carName = rs.getString(1);
                manufacturer = rs.getString(2);
                price = rs.getDouble(3);
                releasedYear = rs.getInt(4);
                car = new Car(carID, carName, manufacturer, price, releasedYear);
               
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
       
        return car;
    }
    public boolean updateCar(Car car) throws Exception {
        Connection cnn = null;
        PreparedStatement preStm = null;
        try {
            cnn = getConnection();
            String sql = "Update Cars Set carName=?, manufacturer=?, price=?, releasedYear=? Where carID=?";
            preStm = cnn.prepareStatement(sql);
            preStm.setString(1, car.getCarName());
            preStm.setString(2, car.getManufacturer());
            preStm.setDouble(3, car.getPrice());
            preStm.setInt(4, car.getReleasedYear());
            preStm.setInt(5, car.getCarID());
            return preStm.executeUpdate() > 0;
        } catch (Exception ex) {
            throw ex;           
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
    }

}
