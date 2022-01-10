package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "vehicle")
public class Vehicle implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "license_plate", unique = true)
    private String licensePlate;
    private int seat;
    @Column(name = "extra_changes")
    private BigDecimal extraChanges;

    @ManyToOne
    @JoinColumn(name = "driver_id", unique = true)
    private User driver;

    @ManyToOne
    @JoinColumn(name = "vehicle_type_id")
    private VehicleType vehicleType;

    public Vehicle() {}

    public Vehicle(String licensePlate, int seat, BigDecimal extraChanges, User driver, VehicleType vehicleType) {
        this.licensePlate = licensePlate;
        this.seat = seat;
        this.extraChanges = extraChanges;
        this.driver = driver;
        this.vehicleType = vehicleType;
    }

    public VehicleType getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(VehicleType vehicleType) {
        this.vehicleType = vehicleType;
    }

    public User getDriver() {
        return driver;
    }

    public void setDriver(User driver) {
        this.driver = driver;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public BigDecimal getExtraChanges() {
        return extraChanges;
    }

    public void setExtraChanges(BigDecimal extraChanges) {
        this.extraChanges = extraChanges;
    }

}
