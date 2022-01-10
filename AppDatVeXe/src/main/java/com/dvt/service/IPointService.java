package com.dvt.service;

import com.dvt.pojos.Point;

import java.util.List;

public interface IPointService extends IGenericsServevice<Point>{
    public List<Point> getAllPoint();
    public Point getPointById(int id);
}
