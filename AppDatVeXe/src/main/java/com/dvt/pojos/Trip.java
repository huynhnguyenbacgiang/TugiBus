package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "trip")
public class Trip implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    @Column(name = "start_time")
    private Date startTime;
    @Column(name = "end_time")
    private Date endTime;
    @Column(name = "blank_seat")
    private int blankSeat;
    @Column(name = "extra_changes")
    private BigDecimal extra_changes;

    @ManyToOne
    @JoinColumn(name = "driver_id")
    private User driver;

    @ManyToOne
    @JoinColumn(name = "line_id")
    private Line line;

    public Trip(){}

    public Trip(Date startTime, Date endTime, int blankSeat, BigDecimal extra_changes, User driver, Line line){
        this.name = "Chuyến " + (line.getTrips().size() + 1);
        this.startTime = startTime;
        this.endTime = endTime;
        this.blankSeat = blankSeat;
        this.extra_changes = extra_changes;
        this.driver = driver;
        this.line = line;
    }

    @OneToMany(mappedBy = "trip", fetch = FetchType.LAZY)
    private List<Ticket> tickets;

    @OneToMany(mappedBy = "trip", fetch = FetchType.LAZY)
    private List<Feedback> feedbacks;

    public List<Feedback> getFeedbacks() {
        return feedbacks;
    }

    public void setFeedbacks(List<Feedback> feedbacks) {
        this.feedbacks = feedbacks;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public User getDriver() {
        return driver;
    }

    public void setDriver(User driver) {
        this.driver = driver;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public int getBlankSeat() {
        return blankSeat;
    }

    public void setBlankSeat(int blankSeat) {
        this.blankSeat = blankSeat;
    }

    public BigDecimal getExtra_changes() {
        return extra_changes;
    }

    public void setExtra_changes(BigDecimal extra_changes) {
        this.extra_changes = extra_changes;
    }
}
