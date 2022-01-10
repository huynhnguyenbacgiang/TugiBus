package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table(name = "ticketdetail")
public class TicketDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "seat_position")
    private int seatPosition;
    private String note;
    @Column(name = "current_price")
    private BigDecimal currentPrice;
    private String transId;

    @ManyToOne
    @JoinColumn(name = "ticket_id")
    private Ticket ticket;

    @ManyToOne
    @JoinColumn(name = "vehicle_id")
    private Vehicle vehicle;

    public TicketDetail() {
    }

    public TicketDetail(int seatPosition, String note, BigDecimal currentPrice
            , String transId, Ticket ticket, Vehicle vehicle) {
        this.seatPosition = seatPosition;
        this.note = note;
        this.currentPrice = currentPrice;
        this.transId = transId;
        this.ticket = ticket;
        this.vehicle = vehicle;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(int seatPosition) {
        this.seatPosition = seatPosition;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public BigDecimal getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(BigDecimal currentPrice) {
        this.currentPrice = currentPrice;
    }
}
