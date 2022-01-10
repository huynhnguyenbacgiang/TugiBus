package com.dvt.repository;

import com.dvt.pojos.Point;

public interface IPointRepository extends IGenericsRepository<Point>{
    public Point getPointById(int id);
}
