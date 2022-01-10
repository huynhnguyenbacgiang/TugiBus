package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "line")
public class Line implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    @ManyToOne
    @JoinColumn(name = "start_point_id")
    private Point startPoint;
    @ManyToOne
    @JoinColumn(name = "end_point_id")
    private Point endPoint;
    private BigDecimal price;
    private int popular_line;
    private int kilometer;
    private int time;


    @OneToMany(mappedBy = "line", fetch = FetchType.LAZY)
    private List<Trip> trips;


    public Line(){}

    public Line (Point startPoint, Point endPoint, BigDecimal price, int distance, int time){
        this.name = startPoint.getAddress() + " -> " + endPoint.getAddress();
        this.startPoint = startPoint;
        this.endPoint = endPoint;
        this.price = price;
        this.kilometer = distance;
        this.time = time;
    }

    public List<Trip> getTrips() {
        return trips;
    }

    public void setTrips(List<Trip> trips) {
        this.trips = trips;
    }

    public Point getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(Point startPoint) {
        this.startPoint = startPoint;
    }

    public Point getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(Point endPoint) {
        this.endPoint = endPoint;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getPopular_line() {
        return popular_line;
    }

    public void setPopular_line(int popular_line) {
        this.popular_line = popular_line;
    }

    public int getKilometer() {
        return kilometer;
    }

    public void setKilometer(int kilometer) {
        this.kilometer = kilometer;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }
}

