package com.dvt.repository.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.repository.ILineRepository;
import com.dvt.repository.IPointRepository;
import com.dvt.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Repository
@Transactional
public class LineRepository extends GenericsRepository<Line> implements ILineRepository {
    @Autowired
    IPointRepository pointRepository;

    @Override
    public Map<Point, List<Line>> getAllLines() {
        Map<Point, List<Line>> allLines = new HashMap<>();
        List<Point> lPoints = pointRepository.getAll();

        for (Point p : lPoints) {
            List<Line> lLines = getLinesBySPoint(p.getId());
            if (lLines.size() > 0) {
                allLines.put(p, lLines);
            }
        }
        return allLines;
    }

    @Override
    public List<Line> getLinesBySPoint(int idSPoint) {
        if (idSPoint > 0) {
            String hql = "from Line where startPoint.id = :idSPoint";

            return getCurrentSession().createQuery(hql)
                    .setParameter("idSPoint", idSPoint).getResultList();
        }

        return null;
    }

    @Override
    public Line getLine(int sPointId, int ePointId) {
        if (sPointId != 0 && ePointId != 0) {
            try {
                String hql1 = "from Line where startPoint.id = :idSPoint and endPoint.id = :idEPoint";
                Line l = (Line) getCurrentSession().createQuery(hql1)
                        .setParameter("idSPoint", sPointId)
                        .setParameter("idEPoint", ePointId)
                        .getSingleResult();

                if (l != null)
                    return l;
            } catch (NoResultException ex) {
                ex.printStackTrace();
            }
        }

        return null;
    }

    @Override
    public List<Line> getPopularLine() {
        List<Line> poLines = new ArrayList<>();

        List<Point> lPoints = pointRepository.getAll();
        for (Point p : lPoints) {
            List<Line> lLines = getLinesBySPoint(p.getId());
            for (Line l : lLines) {
                if (l.getPopular_line() == 1) {
                    poLines.add(l);
                }
            }
        }
        return poLines;
    }

    @Override
    public boolean createLine(Line line) {
        List<Line> lines = getAll();
        for (Line l : lines) {
            if (line.getStartPoint().getId() == l.getStartPoint().getId()
                    && line.getEndPoint().getId() == l.getEndPoint().getId()) {
                return false;
            }
        }
        save(line);
        return true;
    }

    @Override
    public Line getLineById(int lineId) {
        Line l = null;
        try {
            String hql1 = "from Line where id =:id";
            l = (Line) getCurrentSession().createQuery(hql1)
                    .setParameter("id", lineId)
                    .getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return l;
    }
}
