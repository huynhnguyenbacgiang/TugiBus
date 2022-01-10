package com.dvt.pojos;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "point")
public class Point implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String address;
    private String picture;

    @OneToMany(mappedBy = "startPoint", fetch = FetchType.LAZY)
    private List<Line> lines;

    public Point(){}

    public Point(String address, String picture){
        this.address = address;
        this.picture = picture;
    }

    public List<Line> getLines() {
        return lines;
    }

    public void setLines(List<Line> lines) {
        this.lines = lines;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
