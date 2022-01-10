package com.dvt.repository.implement;

import com.dvt.pojos.Line;
import com.dvt.pojos.Point;
import com.dvt.repository.IPointRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import java.util.List;

@Repository
@Transactional
public class PointRepository extends GenericsRepository<Point> implements IPointRepository {
    @Override
    public Point getPointById(int id){
        Point p = null;
        try {
            String hql1 = "from Point where id =:id";
            p = (Point) getCurrentSession().createQuery(hql1)
                    .setParameter("id", id)
                    .getSingleResult();
        } catch (NoResultException ex) {
            ex.printStackTrace();
        }
        return p;
    }
}
