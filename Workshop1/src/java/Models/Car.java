/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author baohu
 */
public class Car {
    private int carID;
    private String carName;
    private String manufacturer;
    private double price;
    private int releasedYear;

    public Car() {
    }

    public Car(int carID, String carName, String manufacturer, double price, int releasedYear) {
        this.carID = carID;
        this.carName = carName;
        this.manufacturer = manufacturer;
        this.price = price;
        this.releasedYear = releasedYear;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getReleasedYear() {
        return releasedYear;
    }

    public void setReleasedYear(int releasedYear) {
        this.releasedYear = releasedYear;
    }
    
    @Override
    public String toString() {
        return String.format("CarID: %d, Car Name: %s, Manufacturer: %s, Price: %f, Released Year: %d" ,carID,carName,manufacturer, price,releasedYear  );
    }
    
}
