package com.dvt.repository;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;

import java.util.List;
import java.util.Map;

public interface ILineRepository extends IGenericsRepository<Line> {
    public Map<Point, List<Line>> getAllLines();
    public List<Line> getLinesBySPoint(int idSPoint);
    public Line getLine(int sPointId, int ePointId);
    public List<Line> getPopularLine();
    public boolean createLine(Line line);
    public Line getLineById(int lineId);
}
