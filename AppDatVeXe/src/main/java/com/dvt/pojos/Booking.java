package com.dvt.pojos;

import java.math.BigDecimal;

public class Booking {
    private String oderId;
    private int tripId;
    private BigDecimal price;
    private int seatPosition;
    private int userId;

    public Booking() {}

    public Booking(String oderId, int tripId, BigDecimal price, int seatPosition, int userId) {
        this.oderId = oderId;
        this.tripId = tripId;
        this.price = price;
        this.seatPosition = seatPosition;
        this.userId = userId;
    }

    public String getOderId() {
        return oderId;
    }

    public void setOderId(String oderId) {
        this.oderId = oderId;
    }

    public int getTripId() {
        return tripId;
    }

    public void setTripId(int tripId) {
        this.tripId = tripId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(int seatPosition) {
        this.seatPosition = seatPosition;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
