package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "ticket")
public class Ticket implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "created_date")
    private Date createdDate;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private User customer;

    @ManyToOne
    @JoinColumn(name = "trip_id")
    private Trip trip;

    @OneToMany(mappedBy = "ticket")
    private List<TicketDetail> ticketDetails;

    public Ticket() {
    }

    public Ticket(Date createdDate, User customer, Trip trip) {
        this.createdDate = createdDate;
        this.customer = customer;
        this.trip = trip;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Trip getTrip() {
        return trip;
    }

    public void setTrip(Trip trip) {
        this.trip = trip;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public List<TicketDetail> getTicketDetails() {
        return ticketDetails;
    }

    public void setTicketDetails(List<TicketDetail> ticketDetails) {
        this.ticketDetails = ticketDetails;
    }
}
