package com.dvt.repository.implement;

import com.dvt.repository.IStatsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class StatsRepository implements IStatsRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<Object[]> lineStats() {
        String hql = "select l.id, l.name, count(tk.id) from Trip t join Ticket tk on  t.id = tk.trip.id "
                + "join Line l on  t.line.id = l.id "
                + "group by l.id";

        return sessionFactory.getObject().getCurrentSession().createQuery(hql).getResultList();
    }

    @Override
    public List<Object[]> tripStats() {
        String hql = "select t.id, t.name, count(tk.id) from Trip t "
                + "join Ticket tk on t.id = tk.trip.id "
                + "group by t.id";

        return sessionFactory.getObject().getCurrentSession().createQuery(hql).getResultList();
    }

    @Override
    public List<Object[]> monthStats(int year) {
        String hql = "select month(createdDate), year(createdDate), count(id) from Ticket "
                + "where year(createdDate) = :year "
                + "group by month(createdDate), year(createdDate)";

        return sessionFactory.getObject().getCurrentSession().createQuery(hql)
                .setParameter("year", year).getResultList();
    }

    @Override
    public List<Object[]> yearStats() {
        String hql = "select year(createdDate), count(id) from Ticket "
                + "group by year(createdDate)";

        return sessionFactory.getObject().getCurrentSession().createQuery(hql).getResultList();
    }

}
